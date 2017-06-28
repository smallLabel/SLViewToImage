//
//  FMMarkerImage.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerImage.h"
#import "FMMarkerContent+FMMarkerContentTool.h"


extern NSString *FMMarkerContentUpdate;
extern NSString *FMMarkerContentNeedRecalculateSize;

@interface FMMarkerImage()

@end


@implementation FMMarkerImage

@synthesize imageSize = _imageSize;
@synthesize frameRatio = _frameRatio;

- (instancetype)init {
    if (self = [super init]) {
        _imageSize = CGSizeMake(30, 30);
        _frameRatio = 20;
    }
    return self;
}

- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
    [self fm_postNotificationWithValue:[NSValue valueWithCGSize:_imageSize]];
}
- (CGFloat)frameRatio {
    return _frameRatio;
}
- (void)setFrameRatio:(CGFloat)frameRatio {
    if (self.frameRatio - frameRatio < 0.01) {
        return;
    }
    _frameRatio = frameRatio;
    [self fm_postNotificationWithValue:@(_frameRatio)];
}



- (FMMarkerContentType)type {
    return FMMARKERCONTENT_IMAGE;
}

- (CGSize)imageSize {
    if (CGSizeEqualToSize(_imageSize, CGSizeZero)) {
        _imageSize = CGSizeMake(30, 30);
    }
    return _imageSize;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self fm_postNotificationWithValue:_image];
}



- (void)fm_postNotificationWithValue:(id)obj {
    BOOL needCalSize = NO;
    if (![obj isKindOfClass:[UIColor class]]) {
        needCalSize = YES;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:FMMarkerContentUpdate object:self userInfo:@{FMMarkerContentNeedRecalculateSize:[NSNumber numberWithBool:needCalSize]}];
}

@end
