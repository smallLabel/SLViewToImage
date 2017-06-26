//
//  FMMarkerText+FMTextTool.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerText+FMTextTool.h"

@implementation FMMarkerText (FMTextTool)

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




@end
