//
//  FMMarkerImage+FMImageTool.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/23.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerImage.h"

@interface FMMarkerImage (FMImageTool)
+ (UIImage *)fm_redrawImage:(UIImage *)image size:(CGSize)size;
@end
