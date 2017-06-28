//
//  FMMarkerTool.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/26.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FMMarkerTool : NSObject

+ (UIImage *)fm_drawRectangleWithCornerRadius:(CGFloat)cornerRadius
                                         size:(CGSize)size
                              backgroundColor:(UIColor *)backgroundColor
                                  strokeColor:(UIColor *)strokeColor;

+ (UIImage *)fm_mergeImage1:(UIImage *)image1
                      rect1:(CGRect)rect1
                     image2:(UIImage *)image2
                      rect2:(CGRect)rect2;

+ (UIImage *)fm_redrawImage:(UIImage *)image
                       size:(CGSize)size
               cornerRadius:(CGFloat)cornerRadius
            backgroundColor:(UIColor *)backgroundColor;

+ (CGSize)fm_calTextSizeWithText:(NSString *)text
                            font:(UIFont *)font;

+ (UIImage *)fm_convertTextToImageWithText:(NSString *)text
                                      size:(CGSize)size
                                 fillColor:(UIColor *)fillColor
                               strokeColor:(UIColor *)strokeColor
                                      font:(UIFont *)font
                                     width:(CGFloat)width;

+ (CGSize)fm_calTextFrameWithTextSize:(CGSize)size
                         cornerRadius:(CGFloat)cornerRadius;
@end
