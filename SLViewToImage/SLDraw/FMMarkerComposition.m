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
#import "FMMarkerText+FMTextTool.h"
#import "FMMarkerImage+FMImageTool.h"
#import "FMMarkerComposition+FMCompositionTool.h"

@interface FMMarkerComposition()
{
    NSMutableArray <FMMarkerContentFlag *>*_flags;//保存每一个markerContent标记信息及space
    CGSize _compositionSize;//尺寸，根据内容动态计算
    UIImage *_baseMap;
}
@end

@implementation FMMarkerComposition

- (instancetype)init {
    if (self = [super init]) {
        _flags = [NSMutableArray array];
        _compositionSize = CGSizeZero;
        _layoutMode = FMMarkerCompositionLayoutMode_HORIZONTAL;
        _margin = 5;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)addMarkerContent:(FMMarkerContent *)markerContent name:(NSString *)name space:(NSInteger)space {
    
    if (space < 1) {
        space = 10;
    }
    FMMarkerContentFlag *flag = [[FMMarkerContentFlag alloc] init];
    flag.markerContent = markerContent;
    flag.name = name;
    flag.space = space;
    [_flags addObject:flag];
    //计算尺寸
    [self fm_analyseMarkerContentWithFlag:flag];
//    [self fm_drawImage:flag];
    [FMMarkerComposition fm_drawImageByFlag:flag];
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
        size = [FMMarkerText fm_calTextSizeWithText:textMarker.text font:textMarker.font];
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
    if (_flags.count == 1) {
        _compositionSize.height = flag.rect.size.height + _compositionSize.height + 2*_margin;
    } else {
        NSInteger index = [_flags indexOfObject:flag];
        FMMarkerContentFlag *lastFlag = (FMMarkerContentFlag *)_flags[index-1];
        _compositionSize.height = flag.rect.size.height + _compositionSize.height + lastFlag.space;
    }
    
}
//计算水平分布的尺寸
- (void)fm_calCompositionHorizontalLayoutSize:(FMMarkerContentFlag *)flag {
    
    if (_compositionSize.height - 2*_margin < flag.rect.size.height) {
        _compositionSize.height = flag.rect.size.height + 2*_margin;
    }
    if (_flags.count == 1) {
        _compositionSize.width = _compositionSize.width + flag.rect.size.width + 2*_margin;
    } else {
        NSInteger index = [_flags indexOfObject:flag];
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
//画图
//- (void)fm_drawImage:(FMMarkerContentFlag *)flag {
//    
//}
//根据不同类型content绘制不同图片
+ (void)fm_drawImageByFlag:(FMMarkerContentFlag *)flag {
    
    if ([flag.markerContent isKindOfClass:[FMMarkerText class]]) {
        FMMarkerText *textMarker = (FMMarkerText *)flag.markerContent;
        flag.image = [FMMarkerText fm_convertTextToImageWithText:textMarker.text size:flag.rect.size fillColor:textMarker.fillColor strokeColor:textMarker.strokeColor font:textMarker.font width:textMarker.strokeWidth];
    } else if ([flag.markerContent isKindOfClass:[FMMarkerImage class]]) {
        FMMarkerImage *imageMarker = (FMMarkerImage *)flag.markerContent;
        flag.image = [FMMarkerImage fm_redrawImage:imageMarker.image size:imageMarker.imageSize];
    } else if ([flag.markerContent isKindOfClass:[FMMarkerComposition class]]) {
        FMMarkerComposition *composition = (FMMarkerComposition *)flag.markerContent;
        flag.image = composition.image;
    }
}
//合并所有图片
- (void)fm_mergerImages {
    //底图
    _baseMap = [FMMarkerComposition fm_drawRectangleWithCornerRadius:self.frameRatio size:self.size backgroundColor:self.backgroundColor];
    for (FMMarkerContentFlag *flag in _flags) {
        _baseMap = [self fm_mergeImage1:_baseMap rect1:CGRectMake(0, 0, self.size.width, self.size.height) image2:flag.image rect2:flag.rect];
    }
}

- (CGSize)size {
    return _compositionSize;
}

- (UIImage *)image {
    return _baseMap;
}

@end
