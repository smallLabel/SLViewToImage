//
//  FMMarkerComposition.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerComposition.h"
#import "FMMarkerImage.h"
#import "FMMarkerText.h"
#import "FMMarkerContentFlag.h"
#import "FMMarkerTool.h"
#import "FMMarkerComposition+FMMarkerCompositionTool.h"
#import "FMMarkerContent+FMMarkerContentTool.h"

extern NSString *FMMarkerContentUpdate;
extern NSString *FMMarkerContentNeedRecalculateSize;


@interface FMMarkerComposition()
{
    NSMutableArray <FMMarkerContentFlag *>*_flags;//保存每一个markerContent标记信息及space
    CGSize _compositionSize;//尺寸，根据内容动态计算
    UIImage *_baseMap;
}
@end

@implementation FMMarkerComposition
@synthesize frameRatio = _frameRatio;
@synthesize backgroundColor = _backgroundColor;

- (instancetype)init {
    if (self = [super init]) {
        _flags = [NSMutableArray array];
        _compositionSize = CGSizeZero;
        _layoutMode = FMMarkerCompositionLayoutMode_HORIZONTAL;
        _margin = 5;
        _frameRatio = 20;
        _backgroundColor = [UIColor whiteColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(update:) name:FMMarkerContentUpdate object:nil];
    }
    return self;
}

- (void)addMarkerContent:(FMMarkerContent *)markerContent name:(NSString *)name space:(NSInteger)space {
    
    if (space < 1) {
        space = 10;
    }
    markerContent.parent = self;
    FMMarkerContentFlag *flag = [[FMMarkerContentFlag alloc] init];
    flag.markerContent = markerContent;
    flag.name = name;
    flag.space = space;
    flag.haveJoined = YES;
    [_flags addObject:flag];
    
    //计算尺寸
    [self fm_analyseMarkerContentWithFlag:flag];
    [self fm_drawImageByFlag:flag];
    [self fm_mergerImages];
}

- (void)fm_analyseMarkerContentWithFlag:(FMMarkerContentFlag *)flag {
    CGSize size = CGSizeZero;
    if ([flag.markerContent isKindOfClass:[FMMarkerImage class]]) {
        FMMarkerImage *imageMarker = (FMMarkerImage *)flag.markerContent;
        if (!imageMarker.image) {
            return;
        }
        //图片元素尺寸由图片尺寸决定
        size = imageMarker.imageSize;
    } else if ([flag.markerContent isKindOfClass:[FMMarkerText class]])
    {
        FMMarkerText *textMarker = (FMMarkerText *)flag.markerContent;
        //计算文字尺寸
        size = [FMMarkerTool fm_calTextSizeWithText:textMarker.text font:textMarker.font];
        size = [FMMarkerTool fm_calTextFrameWithTextSize:size cornerRadius:textMarker.frameRatio];
    } else if ([flag.markerContent isKindOfClass:[FMMarkerComposition class]]) {
        FMMarkerComposition *markerComposition = (FMMarkerComposition *)flag.markerContent;
        size = markerComposition.size;
    }
    flag.rect = CGRectMake(0, 0, size.width, size.height);
    //根据排布方式计算外边框尺寸
    [self fm_calCompositionSizeByLayoutType:self.layoutMode markerContentFlag:flag];
}
//根据布局方式计算外边框尺寸
- (void)fm_calCompositionSizeByLayoutType:(FMMarkerCompositionLayoutMode)mode markerContentFlag:(FMMarkerContentFlag *)flag {
    
    switch (self.layoutMode) {
        case FMMarkerCompositionLayoutMode_HORIZONTAL: {
            [self fm_calCompositionHorizontalLayoutSize:flag];
            [self fm_calCompositionFlagHorizontalLayoutOriginByFlag:flag];
            break;
        }
        case FMMarkerCompositionLayoutMode_VERTICAL: {
            [self fm_calCompositionVerticalLayoutSize:flag];
            [self fm_calCompositionFlagVerticalLayoutOriginByFlag:flag];
            break;
        }
    }
}
//计算垂直排布时添加新元素在容器内的相对坐标
- (void)fm_calCompositionFlagVerticalLayoutOriginByFlag:(FMMarkerContentFlag *)flag {
    CGPoint origin = CGPointMake(_margin, _compositionSize.height - flag.rect.size.height-_margin);
    flag.rect = CGRectMake(origin.x, origin.y, flag.rect.size.width, flag.rect.size.height);
}
//计算水平排布时添加新元素在容器内的相对坐标
- (void)fm_calCompositionFlagHorizontalLayoutOriginByFlag:(FMMarkerContentFlag *)flag {
    CGPoint origin = CGPointMake(_compositionSize.width-_margin-flag.rect.size.width, _margin);
    flag.rect = CGRectMake(origin.x, origin.y, flag.rect.size.width, flag.rect.size.height);
}

//计算垂直分布的尺寸
- (void)fm_calCompositionVerticalLayoutSize:(FMMarkerContentFlag *)flag {
    if (_compositionSize.width - 2*_margin < flag.rect.size.width) {
        _compositionSize.width = flag.rect.size.width + 2*_margin;
    }
    NSInteger index = [_flags indexOfObject:flag];
    if (index == 0) {
        _compositionSize.height = flag.rect.size.height + _compositionSize.height + 2*_margin;
    } else {
       
        FMMarkerContentFlag *lastFlag = (FMMarkerContentFlag *)_flags[index-1];
        _compositionSize.height = flag.rect.size.height + _compositionSize.height + lastFlag.space;
    }
    
}
//计算水平分布的尺寸
- (void)fm_calCompositionHorizontalLayoutSize:(FMMarkerContentFlag *)flag {
    
    if (_compositionSize.height - 2*_margin < flag.rect.size.height) {
        _compositionSize.height = flag.rect.size.height + 2*_margin;
    }
    NSInteger index = [_flags indexOfObject:flag];
    if (index == 0) {
        _compositionSize.width = _compositionSize.width + flag.rect.size.width + 2*_margin;
    } else {
        FMMarkerContentFlag *lastFlag = _flags[index-1];
        _compositionSize.width = _compositionSize.width + flag.rect.size.width + lastFlag.space;
    }
}

- (FMMarkerContent *)markerContentByName:(NSString *)name {
    
    for (FMMarkerContentFlag *flag in _flags) {
        if ([flag.name isEqualToString:name]) {
            return flag.markerContent;
        }
    }
    return nil;
}

- (FMMarkerContentType)type {
    return FMMARKERCONTENT_COMPOSITION;
}

//合并所有图片
- (void)fm_mergerImages {
    //底图
    _baseMap = [FMMarkerTool fm_drawRectangleWithCornerRadius:self.frameRatio size:self.size backgroundColor:self.backgroundColor strokeColor:self.backgroundColor];
    for (FMMarkerContentFlag *flag in _flags) {
        _baseMap = [FMMarkerTool fm_mergeImage1:_baseMap rect1:CGRectMake(0, 0, self.size.width, self.size.height) image2:flag.image rect2:flag.rect];
    }
}

- (CGSize)size {
    return _compositionSize;
}

- (UIImage *)image {
    return _baseMap;
}

- (void)setLayoutMode:(FMMarkerCompositionLayoutMode)layoutMode {
    if (_layoutMode == layoutMode) {
        return;
    }
    _layoutMode = layoutMode;
    if (_baseMap) {
        [self fm_updateContentWithNeedRecalculateSize:YES flags:_flags];
    }
    
}

- (void)setMargin:(CGFloat)margin {
    if (_margin - margin<0.01) {
        return;
    }
    _margin = margin;
    if (_baseMap) {
        [self fm_updateContentWithNeedRecalculateSize:YES flags:_flags];
    }
}

- (void)setFrameRatio:(CGFloat)frameRatio {
    if (self.frameRatio - frameRatio < 0.01) {
        return;
    }
    _frameRatio = frameRatio;
    if (_baseMap) {
        [self fm_updateContentWithNeedRecalculateSize:YES flags:_flags];
    }
    
}

- (CGFloat)frameRatio {
    return _frameRatio;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    if (_baseMap) {
        [self fm_updateContentWithNeedRecalculateSize:YES flags:_flags];
    }
}

- (UIColor *)backgroundColor {
    return _backgroundColor;
}


@end
