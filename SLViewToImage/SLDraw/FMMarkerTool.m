//
//  FMMarkerTool.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/26.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerTool.h"

@implementation FMMarkerTool
+ (UIImage *)fm_drawRectangleWithCornerRadius:(CGFloat)cornerRadius
                                         size:(CGSize)size
                              backgroundColor:(UIColor *)backgroundColor
                                  strokeColor:(UIColor *)strokeColor {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGFloat minValue = MIN(size.width, size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:minValue/cornerRadius];
    [backgroundColor setFill];
    [path fill];
    [strokeColor setStroke];
    [path stroke];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIImage *)fm_mergeImage1:(UIImage *)image1
                      rect1:(CGRect)rect1
                     image2:(UIImage *)image2
                      rect2:(CGRect)rect2 {
    UIGraphicsBeginImageContextWithOptions(rect1.size, NO, 0.0);
    [image1 drawInRect:rect1];
    [image2 drawInRect:rect2];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}
+ (UIImage *)fm_redrawImage:(UIImage *)image
                       size:(CGSize)size
               cornerRadius:(CGFloat)cornerRadius
            backgroundColor:(UIColor *)backgroundColor {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGFloat minValue = MIN(size.width, size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:minValue/cornerRadius];
    [backgroundColor setFill];
    [path fill];
    [path addClip];
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (CGSize)fm_calTextSizeWithText:(NSString *)text font:(UIFont *)font {
    CGSize  size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    size = CGSizeMake(size.width, size.height);
    return size;
}

+ (UIImage *)fm_convertTextToImageWithText:(NSString *)text
                                      size:(CGSize)size
                                 fillColor:(UIColor *)fillColor
                               strokeColor:(UIColor *)strokeColor
                                      font:(UIFont *)font
                                     width:(CGFloat)width {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetTextDrawingMode (context, kCGTextFill);
//    CGContextSetFillColorWithColor(context, fillColor.CGColor);
//    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
//    CGContextSetLineWidth(context, width);
   
    [text drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:@{NSFontAttributeName:font, NSStrokeColorAttributeName:strokeColor, NSForegroundColorAttributeName:fillColor, NSStrokeWidthAttributeName:@(width)}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (CGSize)fm_calTextFrameWithTextSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    CGFloat margin = sqrt(cornerRadius/2.0);
    return CGSizeMake(size.width + margin, size.height + margin);
}
@end
