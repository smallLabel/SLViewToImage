//
//  SLCollectionMarker.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/19.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "SLCollectionMarker.h"
#import "SLLabelElement.h"
#import "SLFrameElement.h"
#import "SLImageElement.h"
#import "UIView+SLViewToImage.h"

@interface SLCollectionMarker()
{
    SLFrameElement *_baseFrameElement;
    UIImageView *_baseImageView;
}

//- (CGRect)SL_convertPointSubViewToRootViewWithSubView:(UIView *)subView rootFrameElement:(SLFrameElement *)rootFrameElement;
- (void)SL_addImageToKernel:(UIImage *)image position:(CGRect)rect;

- (void)SL_classifyFrameElementSubViews:(SLFrameElement *)framenElement;
- (void)SL_conductSubView:(UIView *)subView;
//获取根视图外边框并绘制
- (void)SL_rootFrameElement:(SLFrameElement *)frameElement;
@end


@implementation SLCollectionMarker

- (UIImageView *)addFrameElement:(SLFrameElement *)frameElement {
    if (!frameElement) {
        return nil;
    }
    _baseFrameElement = frameElement;
    _baseImageView = [[UIImageView alloc] initWithFrame:frameElement.frame];
//    SLFrameElement *tmpFrameELement = [self duplicate:frameElement];
//    [self deepCopyAllSubviews:frameElement.subviews newView:tmpFrameELement];
    [self SL_rootFrameElement:frameElement];
//    [self SL_classifyFrameElementSubViews:tmpFrameELement];
    return _baseImageView;
    
}

- (void)updateFrameElement:(SLFrameElement *)frameElement {
    
}

- (void)updateImageElement:(SLImageElement *)imageElement {
    
}

- (void)updateLabelElement:(SLLabelElement *)labelElement {
    
}

- (void)SL_classifyFrameElementSubViews:(SLFrameElement *)framenElement {
    for (UIView *subview in framenElement.subviews) {
        if ([subview isKindOfClass:[SLLabelElement class]] ||
            [subview isKindOfClass:[SLImageElement class]]) {
            [self SL_conductSubView:subview];
            [subview removeFromSuperview];
        } else if ([subview isKindOfClass:[SLFrameElement class]]) {
//            SLFrameElement *tmp = (SLFrameElement *)subview;
//            [self SL_classifyFrameElementSubViews:tmp];
//            [self SL_conductSubView:tmp];
//            [tmp removeFromSuperview];
        } else {
            continue;
        }
    }
}

- (void)SL_rootFrameElement:(SLFrameElement *)frameElement {
//    SLFrameElement *rootFrameElementCopy = [self duplicate:frameElement];
//    [self deepCopyAllSubviews:frameElement.subviews newView:rootFrameElementCopy];
    
//    for (UIView *subview in frameElement.subviews) {
//        [subview removeFromSuperview];
//    }
    [self SL_conductRootFrameElement:frameElement];
    
}

- (void)SL_conductRootFrameElement:(SLFrameElement *)rootFrameElement {
    UIImage *image = [rootFrameElement sl_viewToImage];
    [self SL_addImageToKernel:image position:rootFrameElement.frame];
}

//处理子视图并传递给底层
- (void)SL_conductSubView:(UIView *)subView {
    CGRect rect = [self SL_convertPointSubViewToRootViewWithSubView:subView];
    UIImage *image = [subView sl_viewToImage];
    [self SL_addImageToKernel:image position:rect];
}

//将子视图坐标系转化到根视图坐标系
- (CGRect)SL_convertPointSubViewToRootViewWithSubView:(UIView *)subView {
    return [_baseFrameElement convertRect:subView.frame fromView:subView.superview];
}
//将转化的视图图片和视图rect传递给底层
- (void)SL_addImageToKernel:(UIImage *)image position:(CGRect)rect {
    if (!image) {
        return;
    }
    
    UIGraphicsBeginImageContextWithOptions(_baseFrameElement.frame.size, NO, 0.0);
    UIImage *originalImage = _baseImageView.image;
    
    if (originalImage != nil) {
        CGImageRef originalImageRef = originalImage.CGImage;
        [originalImage drawInRect:CGRectMake(0, 0, CGImageGetWidth(originalImageRef), CGImageGetHeight(originalImageRef))];
    }
   
    CGImageRef imageRef = image.CGImage;
    [image drawInRect:CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), CGImageGetWidth(imageRef), CGImageGetHeight(imageRef))];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(imageRef);
    if (originalImage) {
        CGImageRelease(originalImage.CGImage);
    }
    
    _baseImageView.image = newImage;
}

- (id)duplicate:(UIView *)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

- (void)deepCopyAllSubviews:(NSArray*)subviews newView:(UIView *)flatView {
    
    [subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIView *newView = [self duplicate:(UIView *)obj];
        CGRect frame = [(UIView*)obj frame];
        
        frame.origin = [((UIView *)obj).superview convertPoint:frame.origin toView:flatView];
        
        [(UIView *)obj setFrame:frame];
        
        [flatView addSubview:newView];
        
        NSArray *subs = [(UIView*)obj subviews];
        
        if ([subs count]>0) {
            
            [self deepCopyAllSubviews:subs newView:flatView];
        }
    }];
}
@end
