//
//  FMMarkerText.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerText.h"

@interface FMMarkerText()


@end
@implementation FMMarkerText

- (instancetype)init {
    self = [super init];
    if (self) {
        _font = [UIFont  systemFontOfSize:16];
        _fillColor = [UIColor blackColor];
        _strokeColor = [UIColor whiteColor];
    }
    return self;
}

- (FMMarkerContentType)type {
    return FMMARKERCONTENT_TEXT;
}

@end
