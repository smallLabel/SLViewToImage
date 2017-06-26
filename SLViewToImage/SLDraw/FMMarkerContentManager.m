//
//  FMMarkerContentManager.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/26.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContentManager.h"

static FMMarkerContentManager *mManager = nil;
@interface FMMarkerContentManager()

@end

@implementation FMMarkerContentManager

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mManager = [[FMMarkerContentManager alloc] init];
    });
    return mManager;
}

@end
