//
//  FMMarkerContent.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContent.h"

@implementation FMMarkerContent

- (instancetype)init {
    self = [super init];
    if (self) {
        _frameRatio = 6.0;
        _backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (FMMarkerContentType)type {
    return 0;
}

@end
