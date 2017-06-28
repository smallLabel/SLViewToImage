//
//  FMMarkerContentManager.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/26.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContentManager.h"
#import "FMMarkerContent+FMMarkerContentTool.h"
#import "FMMarkerText.h"
#import "FMMarkerImage.h"
#import "FMMarkerComposition.h"
#import "FMMarkerContentFlag.h"


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



- (void)update:(NSNotification *)notification {
    NSDictionary *dic = notification.userInfo;
    FMMarkerContent *markerContent = notification.object;
    
    
    //判断是否包含这个
    if ([self fm_containMarkerContent:markerContent flags:_flags]) {
        BOOL needRecalSize = [dic[FMMarkerContentNeedRecalculateSize] boolValue];
        NSArray *flags = (NSArray *)[markerContent.parent valueForKey:@"_flags"];
        [self fm_rootCompositionUpdateWithMarkerContent:markerContent needRecalSize:needRecalSize flags:flags];
        //        [self fm_updateContentWithNeedRecalculateSize:needRecalSize flags:_flags];
    }
}

- (void)fm_rootCompositionUpdateWithMarkerContent:(FMMarkerContent *)markerContent needRecalSize:(BOOL)needCal flags:(NSArray *)flags {
    FMMarkerComposition *parent = (FMMarkerComposition *)markerContent.parent;
    SEL sel = @selector(fm_updateContentWithNeedRecalculateSize:markerContent:);
    [parent performSelector:sel withObject:[NSNumber numberWithBool:needCal] withObject:parent];
    if (parent) {
        NSArray *parentFlags = (NSArray *)[parent valueForKey:@"_flags"];
        [self fm_rootCompositionUpdateWithMarkerContent:parent needRecalSize:needCal flags:parentFlags];
    }
    
}

- (void)fm_updateContentWithNeedRecalculateSize:(BOOL)needRecalculateSize markerContent:(FMMarkerContent *)markerContent {
    SEL analySel = @selector(fm_analyseMarkerContentWithFlag:);
    SEL drawSel = @selector(fm_analyseMarkerContentWithFlag:);
    SEL mergeSel = @selector(fm_mergerImages);
    FMMarkerComposition *markerComposition = (FMMarkerComposition *)markerContent;
    NSArray *flags = [markerComposition valueForKey:@"_flags"];
    
    for (FMMarkerContentFlag *flag in flags) {
        if (needRecalculateSize && flag.haveJoined) {
            [markerComposition performSelector:analySel withObject:flags];
        }
        [FMMarkerComposition fm_drawImageByFlag:flag];
        FMMarkerComposition 
        [self fm_mergerImages];
    }
}



@end
