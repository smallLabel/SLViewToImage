//
//  FMMarkerComposition.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContent.h"

typedef NS_ENUM(NSInteger, FMMarkerCompositionLayoutMode) {
    FMMarkerCompositionLayoutMode_HORIZONTAL = 1,
    FMMarkerCompositionLayoutMode_VERTICAL
};

@interface FMMarkerComposition : FMMarkerContent
///元素排布方式，分为水平排布和垂直排布，默认为水平排布
@property (nonatomic) FMMarkerCompositionLayoutMode layoutMode;
///容器size，由容器内元素size及排布方式动态计算
@property (nonatomic, readonly) CGSize size;

@property (nonatomic) CGFloat margin;

@property (nonatomic, readonly) UIImage * _Nullable image;

- (void)addMarkerContent:(nonnull FMMarkerContent *)markerContent
                    name:(nonnull NSString *)name
                   space:(NSInteger)space;

- (FMMarkerContent *_Nullable)markerContentByName:(nonnull NSString *)name;

@end
