//
//  SLCollectionMarker.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/19.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SLLabelElement, SLImageElement, SLFrameElement;

@interface SLCollectionMarker : NSObject

//添加外边框
- (UIImageView *)addFrameElement:(SLFrameElement *)frameElement;
//更新外边框
- (void)updateFrameElement:(SLFrameElement *)frameElement;
//更新文字标签
- (void)updateLabelElement:(SLLabelElement *)labelElement;
//更新图片
- (void)updateImageElement:(SLImageElement *)imageElement;


@end
