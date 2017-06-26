//
//  FMMarkerComposition+FMCompositionTool.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/23.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerComposition+FMCompositionTool.h"

@implementation FMMarkerComposition (FMCompositionTool)

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
- (UIImage *)fm_mergeImage1:(UIImage *)image1
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
@end
