//
//  FMMarkerComposition+FMCompositionTool.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/23.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerComposition.h"

@interface FMMarkerComposition (FMCompositionTool)

+ (UIImage *)fm_drawRectangleWithCornerRadius:(CGFloat)cornerRadius
                                      size:(CGSize)size
                           backgroundColor:(UIColor *)backgroundColor;
- (UIImage *)fm_mergeImage1:(UIImage *)image1
                      rect1:(CGRect)rect1
                     image2:(UIImage *)image2
                      rect2:(CGRect)rect2;
@end
