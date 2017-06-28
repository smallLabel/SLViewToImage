//
//  FMMarkerContentFlag.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/23.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMMarkerContent.h"

@interface FMMarkerContentFlag : NSObject

@property (nonatomic, strong) FMMarkerContent *markerContent;
//元素唯一标识
@property (nonatomic, copy) NSString *name;
//元素space
@property (nonatomic) NSInteger space;
//元素真实尺寸
@property (nonatomic) CGRect rect;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic) BOOL haveJoined;

@end
