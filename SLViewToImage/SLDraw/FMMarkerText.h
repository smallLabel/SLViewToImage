//
//  FMMarkerText.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContent.h"

typedef NS_ENUM(NSInteger, FMMarkerTextLayoutDirectionMode) {
    FMMTLD_VERTICAL = 0,
    FMMTLD_HORIZONTAL
};

@interface FMMarkerText : FMMarkerContent
@property (nonatomic) int strokeWidth;
@property (nonatomic) FMMarkerTextLayoutDirectionMode layoutDirectionMode;
@property (nonatomic, strong, nullable) UIFont *font;
@property (nonatomic, copy, nonnull) NSString *text;
@property (nonatomic, strong, nullable) UIColor *fillColor;
@property (nonatomic, strong, nullable) UIColor *strokeColor;
@end
