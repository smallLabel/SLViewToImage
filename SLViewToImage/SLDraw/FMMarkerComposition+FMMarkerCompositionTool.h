//
//  FMMarkerComposition+FMMarkerCompositionTool.h
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/26.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerComposition.h"

@class FMMarkerContentFlag;

@interface FMMarkerComposition (FMMarkerCompositionTool)

+ (void)fm_drawImageByFlag:(FMMarkerContentFlag *)flag;

@end
