//
//  FMMarkerComposition+FMMarkerCompositionTool.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/26.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "FMMarkerComposition+FMMarkerCompositionTool.h"
#import "FMMarkerContentFlag.h"
#import "FMMarkerText.h"
#import "FMMarkerImage.h"
#import "FMMarkerTool.h"

@implementation FMMarkerComposition (FMMarkerCompositionTool)
//根据不同类型content绘制不同图片
+ (void)fm_drawImageByFlag:(FMMarkerContentFlag *)flag {
    
    if ([flag.markerContent isKindOfClass:[FMMarkerText class]]) {
        FMMarkerText *textMarker = (FMMarkerText *)flag.markerContent;
        flag.image = [FMMarkerTool fm_convertTextToImageWithText:textMarker.text size:flag.rect.size fillColor:textMarker.fillColor strokeColor:textMarker.strokeColor font:textMarker.font width:textMarker.strokeWidth];
        UIImage *frameImage = [FMMarkerTool fm_drawRectangleWithCornerRadius:textMarker.frameRatio size:flag.rect.size backgroundColor:textMarker.backgroundColor];
        CGFloat margin = sqrt(textMarker.frameRatio/2.0);
        CGSize realSize = [FMMarkerTool fm_calTextSizeWithText:textMarker.text font:textMarker.font];
        flag.image = [FMMarkerTool fm_mergeImage1:frameImage rect1:CGRectMake(0, 0, flag.rect.size.width, flag.rect.size.height) image2:flag.image rect2:CGRectMake(margin, margin, realSize.width, realSize.height)];
    } else if ([flag.markerContent isKindOfClass:[FMMarkerImage class]]) {
        FMMarkerImage *imageMarker = (FMMarkerImage *)flag.markerContent;
        
        flag.image = [FMMarkerTool fm_redrawImage:imageMarker.image size:imageMarker.imageSize cornerRadius:imageMarker.frameRatio backgroundColor:imageMarker.backgroundColor];
    } else if ([flag.markerContent isKindOfClass:[FMMarkerComposition class]]) {
        FMMarkerComposition *composition = (FMMarkerComposition *)flag.markerContent;
        flag.image = composition.image;
    }
}
@end
