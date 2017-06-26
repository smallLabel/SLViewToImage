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
                              backgroundColor:(UIColor *)backgroundColor {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:cornerRadius];
    [backgroundColor setFill];
    [path fill];
    [[UIColor cyanColor] setStroke];
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
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:cornerRadius];
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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextDrawingMode (context, kCGTextFillStroke);
    CGFloat r,g,b,a = 0.0;
    [fillColor getRed:&r green:&g blue:&b alpha:&a];
    CGContextSetRGBFillColor (context, r, g, b, a);
    r = 0.0; g = 0.0; b = 0.0; a = 0.0;
    [fillColor getRed:&r green:&g blue:&b alpha:&a];
    CGContextSetRGBStrokeColor (context, r, g, b, a);
    CGContextSetLineWidth(context, width);
    
    [text drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:@{NSFontAttributeName:font}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (CGSize)fm_calTextFrameWithTextSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    CGFloat margin = sqrt(cornerRadius/2.0);
    return CGSizeMake(size.width + margin, size.height + margin);
}
@end
