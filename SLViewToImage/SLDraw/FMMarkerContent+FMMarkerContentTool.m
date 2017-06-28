//
//  FMMarkerContent+FMMarkerContentTool.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/27.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContent+FMMarkerContentTool.h"
#import <objc/runtime.h>

static char *const FMMarkerContentParent = "FMMarkerContentParent";
@implementation FMMarkerContent (FMMarkerContentTool)

- (void)setParent:(FMMarkerContent *)parent {
    objc_setAssociatedObject(self, &FMMarkerContentParent, parent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FMMarkerContent *)parent {
    return objc_getAssociatedObject(self, &FMMarkerContentParent);
}

@end
