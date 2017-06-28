//
//  UIColor+Hex.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

/**
 * Creates a new UIColor instance using a hex input and alpha value.
 *
 * @param {UInt32} Hex
 * @param {CGFloat} Alpha
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
    
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:alpha];
}

/**
 * Creates a new UIColor instance using a hex input.
 *
 * @param {UInt32} Hex
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [self colorWithHex:hex andAlpha:1.0];
}

/**
 * Creates a new UIColor instance using a hex string input.
 *
 * @param {NSString} Hex string (ie: @"ff", @"#fff", @"ff0000", or @"ff00ffcc")
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

/**
 * Returns the hex value of the receiver. Alpha value is not included.
 *
 * @return {UInt32}
 */
- (UInt32)hexValue {
    CGFloat r,g,b,a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    UInt32 ri = r*255.0;
    UInt32 gi = g*255.0;
    UInt32 bi = b*255.0;
    
    return (ri<<16) + (gi<<8) + bi;
}

+ (UIColor *)colorR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

@end
