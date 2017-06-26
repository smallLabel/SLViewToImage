//
//  SLElementAttribute.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/19.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLElementAttribute <NSObject>

- (void)setUniqueIdentifier:(NSString *)uniqueIdentifier;
- (NSString *)uniqueIdentifier;

@end
