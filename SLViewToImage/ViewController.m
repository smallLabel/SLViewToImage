//
//  ViewController.m
//  SLViewToImage
//
//  Created by lijunhong on 2017/6/16.
//  Copyright © 2017年 smallLabel. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SLViewToImage.h"
#import "SLCollectionMarker.h"
#import "SLFrameElement.h"
#import "SLLabelElement.h"
#import "SLImageElement.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>

#import "FMMarkerText.h"
#import "FMMarkerImage.h"
#import "FMMarkerComposition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 30, 200)];
//    [self.view addSubview:label];
//    NSString *str = @"qwertyuiolkjhgf";
//    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
//    
//    [attStr addAttribute:NSVerticalGlyphFormAttributeName value:@1 range:NSMakeRange(0, str.length)];
//    label.attributedText = attStr;
//    NSLog(@"%@",attStr);
    
    FMMarkerText *text = [[FMMarkerText alloc] init];
    text.text = @"今儿下雨了";
    text.fillColor = [UIColor redColor];
    text.strokeWidth = 1.0;
    text.strokeColor = [UIColor greenColor];
    text.font = [UIFont systemFontOfSize:16];
    
    FMMarkerImage *imageMarker = [[FMMarkerImage alloc] init];
    imageMarker.image = [UIImage imageNamed:@"fengmap"];

    FMMarkerComposition *composition = [[FMMarkerComposition alloc] init];
//    composition.backgroundColor = [UIColor yellowColor];
    composition.frameRatio = 6.0;
    [composition addMarkerContent:imageMarker name:@"image" space:10];
    [composition addMarkerContent:text name:@"text" space:10];
    
    FMMarkerComposition *composition1 = [[FMMarkerComposition alloc] init];
    //    composition.backgroundColor = [UIColor yellowColor];
    composition1.frameRatio = 6.0;
    [composition1 addMarkerContent:imageMarker name:@"image" space:10];
    [composition1 addMarkerContent:text name:@"text" space:10];
    
    FMMarkerComposition *com = [[FMMarkerComposition alloc] init];
    com.layoutMode = FMMarkerCompositionLayoutMode_VERTICAL;
    com.frameRatio = 6.0;
    [com addMarkerContent:composition1 name:@"23" space:10];
    [com addMarkerContent:composition name:@"34" space:10];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, com.size.width, com.size.height)];
    imageView.image = com.image;
    [self.view addSubview:imageView];
}


- (SLFrameElement *)createContainer {
    SLFrameElement *view = [[SLFrameElement alloc] initWithFrame:CGRectMake(10, 10, 300, 200)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.borderWidth = 1.0;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    view.layer.borderColor = [UIColor redColor].CGColor;
    
    SLLabelElement *label = [[SLLabelElement alloc] initWithFrame:CGRectMake(10, 10, 200, 100)];
    
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"据外媒报道，美国太空探索技术公司SpaceX"];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 字体的行间距
    paragraphStyle.lineSpacing = 10;
    //首行缩进
    paragraphStyle.firstLineHeadIndent = 20.0f;
    //（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
    //    paragraphStyle.alignment = NSTextAlignmentLeft;
    //结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
    //    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.headIndent = 20;//整体缩进(首行除外)
    //设置尾部缩进后就出问题
    //    paragraphStyle.tailIndent = 2;//尾部缩进
    paragraphStyle.minimumLineHeight = 10;//最低行高
    paragraphStyle.maximumLineHeight = 20;//最大行高
    //    paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
    paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️⬇️⬅️三种）
    
    paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
    paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
    [mutableAttributedstring addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mutableAttributedstring.length)];
    [mutableAttributedstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0, mutableAttributedstring.length)];
    [mutableAttributedstring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, 5)];

    
    label.attributedText = mutableAttributedstring;
    label.numberOfLines = 0;
    SLImageElement *imageView = [[SLImageElement alloc] initWithFrame:CGRectMake(10, 120, 80, 80)];
    imageView.image = [UIImage imageNamed:@"fengmap"];
    [view addSubview:label];
    [view addSubview:imageView];
    return view;
}
- (SLFrameElement *)createContainer1 {
    SLFrameElement *view = [[SLFrameElement alloc] initWithFrame:CGRectMake(10, 210, 300, 200)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.borderWidth = 1.0;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    view.layer.borderColor = [UIColor redColor].CGColor;
    
    SLLabelElement *label = [[SLLabelElement alloc] initWithFrame:CGRectMake(10, 10, 200, 100)];
    
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"据外媒报道，美国太空探索技术公司SpaceX"];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 字体的行间距
    paragraphStyle.lineSpacing = 10;
    //首行缩进
    paragraphStyle.firstLineHeadIndent = 20.0f;
    //（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
    //    paragraphStyle.alignment = NSTextAlignmentLeft;
    //结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
    //    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.headIndent = 20;//整体缩进(首行除外)
    //设置尾部缩进后就出问题
    //    paragraphStyle.tailIndent = 2;//尾部缩进
    paragraphStyle.minimumLineHeight = 10;//最低行高
    paragraphStyle.maximumLineHeight = 20;//最大行高
    //    paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
    paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️⬇️⬅️三种）
    
    paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
    paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
    [mutableAttributedstring addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mutableAttributedstring.length)];
    [mutableAttributedstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0, mutableAttributedstring.length)];
    [mutableAttributedstring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, 5)];
    
    
    label.attributedText = mutableAttributedstring;
    label.numberOfLines = 0;
    SLImageElement *imageView = [[SLImageElement alloc] initWithFrame:CGRectMake(10, 120, 80, 80)];
    imageView.image = [UIImage imageNamed:@"fengmap"];
    [view addSubview:label];
    [view addSubview:imageView];
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
