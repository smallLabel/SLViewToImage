//
//  FMMarkerImage+FMImageTool.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/23.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerImage+FMImageTool.h"

@implementation FMMarkerImage (FMImageTool)

+ (UIImage *)fm_redrawImage:(UIImage *)image size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
