//
//  SLLabelElement.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/19.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "SLLabelElement.h"


@interface SLLabelElement()
{
    NSString *_uniqueIdentifier;
}
@end
@implementation SLLabelElement

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUniqueIdentifier:(NSString *)uniqueIdentifier {
    _uniqueIdentifier = uniqueIdentifier;
}

- (NSString *)uniqueIdentifier {
    return _uniqueIdentifier;
}

@end
