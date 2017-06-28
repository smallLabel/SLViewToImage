//
//  FMMarkerText.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerText.h"
#import "FMMarkerContent+FMMarkerContentTool.h"

extern NSString *FMMarkerContentUpdate;
extern NSString *FMMarkerContentNeedRecalculateSize;

@interface FMMarkerText()

@end
@implementation FMMarkerText

@synthesize frameRatio = _frameRatio;
@synthesize backgroundColor = _backgroundColor;
@synthesize strokeWidth = _strokeWidth;
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;
@synthesize font = _font;


- (instancetype)init {
    self = [super init];
    if (self) {
        _font = [UIFont systemFontOfSize:16];
        _fillColor = [UIColor blackColor];
        _strokeColor = [UIColor lightTextColor];
        _strokeWidth = 0.1;
        _frameRatio = 20;
    }
    return self;
}

- (FMMarkerContentType)type {
    return FMMARKERCONTENT_TEXT;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    [self fm_postNotificationWithValue:_strokeColor];
}

- (int)strokeWidth {
    return _strokeWidth;
}

- (void)setStrokeWidth:(int)strokeWidth {
    _strokeWidth = strokeWidth;
    [self fm_postNotificationWithValue:@(_strokeWidth)];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [self fm_postNotificationWithValue:_font];
}

- (void)setText:(NSString *)text {
    if ([text isEqualToString:_text]) {
        return;
    }
    _text = text;
    [self fm_postNotificationWithValue:_text];
}
- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    [self fm_postNotificationWithValue:_fillColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
     [self fm_postNotificationWithValue:_backgroundColor];
}

- (void)setFrameRatio:(CGFloat)frameRatio {
    if (self.frameRatio - frameRatio < 0.01) {
        return;
    }
    _frameRatio = frameRatio;
    [self fm_postNotificationWithValue:@(_frameRatio)];
}

- (CGFloat)frameRatio {
    return _frameRatio;
}

- (void)fm_postNotificationWithValue:(id)obj {
    BOOL needCalSize = NO;
    if (![obj isKindOfClass:[UIColor class]]) {
        needCalSize = YES;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:FMMarkerContentUpdate object:self userInfo:@{FMMarkerContentNeedRecalculateSize:[NSNumber numberWithBool:needCalSize]}];
}
@end
