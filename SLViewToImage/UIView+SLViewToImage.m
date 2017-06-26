//
//  UIView+SLViewToImage.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/16.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "UIView+SLViewToImage.h"

@implementation UIView (SLViewToImage)

- (UIImage *)sl_viewToImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,[UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
