//
//  FMMarkerContent.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FMMarkerContentType) {
    FMMARKERCONTENT_TEXT = 1,
    FMMARKERCONTENT_IMAGE,
    FMMARKERCONTENT_COMPOSITION,
};

@interface FMMarkerContent : NSObject

@property (nonatomic, readonly) FMMarkerContentType type;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic) CGFloat frameRatio;

@end
