//
//  FMMarkerImage.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerImage.h"


@interface FMMarkerImage()

@end

@implementation FMMarkerImage

- (instancetype)init {
    if (self = [super init]) {
        _imageSize = CGSizeZero;
    }
    return self;
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


@end
