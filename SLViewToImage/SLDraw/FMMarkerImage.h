//
//  FMMarkerImage.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/22.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerContent.h"


@interface FMMarkerImage : FMMarkerContent

@property (nonatomic, strong, nonnull) UIImage *image;
@property (nonatomic, assign,readwrite) CGSize imageSize;

@end
