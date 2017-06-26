//
//  SLImageElement.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/19.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "SLImageElement.h"

@interface SLImageElement()
{
    NSString *_uniqueIdentifier;
}
@end

@implementation SLImageElement

- (void)setUniqueIdentifier:(NSString *)uniqueIdentifier {
    _uniqueIdentifier = uniqueIdentifier;
}

- (NSString *)uniqueIdentifier {
    return _uniqueIdentifier;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
