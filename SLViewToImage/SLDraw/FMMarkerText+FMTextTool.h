//
//  FMMarkerText+FMTextTool.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerText.h"

@interface FMMarkerText (FMTextTool)

+ (CGSize)fm_calTextSizeWithText:(NSString *)text
                            font:(UIFont *)font;

+ (UIImage *)fm_convertTextToImageWithText:(NSString *)text
                                      size:(CGSize)size
                                 fillColor:(UIColor *)fillColor
                               strokeColor:(UIColor *)strokeColor
                                      font:(UIFont *)font
                                     width:(CGFloat)width;

@end
