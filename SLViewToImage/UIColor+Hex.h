//
//  UIColor+Hex.h
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

- (UInt32)hexValue;
+ (UIColor *)colorR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;
@end
