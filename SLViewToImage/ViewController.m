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

#import "UIColor+Hex.h"

@interface ViewController ()
{
    FMMarkerText *text3;
    UIImageView *imageView;
    FMMarkerComposition *com;
}
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
   /*
    FMMarkerComposition *com = [[FMMarkerComposition alloc] init];
    FMMarkerText *text1 = [[FMMarkerText alloc] init];
    text1.text = @"吃午饭了吗？";
    
    FMMarkerImage *image1 = [[FMMarkerImage alloc] init];
    image1.image = [UIImage imageNamed:@"test.jpg"];
    image1.imageSize = CGSizeMake(40, 40);
    
    FMMarkerText *text = [[FMMarkerText alloc] init];
    text.text = @"今儿下雨了";
    text.fillColor = [UIColor redColor];
    text.strokeWidth = 1.0;
    text.strokeColor = [UIColor greenColor];
    text.font = [UIFont systemFontOfSize:16];
    text.backgroundColor = [UIColor yellowColor];
    text.frameRatio = 6.0;
    
    FMMarkerImage *imageMarker = [[FMMarkerImage alloc] init];
    imageMarker.image = [UIImage imageNamed:@"test.jpg"];

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
    [composition1 addMarkerContent:image1 name:@"432" space:10];
    
    com.layoutMode = FMMarkerCompositionLayoutMode_VERTICAL;
    com.frameRatio = 6.0;
    com.backgroundColor = [UIColor redColor];
    [com addMarkerContent:text1 name:@"234" space:10];
    [com addMarkerContent:image1 name:@"23" space:10];
    [com addMarkerContent:composition1 name:@"23" space:10];
    [com addMarkerContent:composition name:@"34" space:10];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, com.size.width, com.size.height)];
    imageView.image = com.image;
    [self.view addSubview:imageView];
    */
    
    com = [[FMMarkerComposition alloc] init];
    com.backgroundColor = [UIColor colorWithRed:155/255.0 green:212/255.0 blue:252/255.0 alpha:1.0];
    
    FMMarkerImage *image1 = [[FMMarkerImage alloc] init];
    image1.image = [UIImage imageNamed:@"test.jpg"];
    image1.imageSize = CGSizeMake(60, 60);
    image1.backgroundColor = [UIColor colorR:204 G:233 B:253];
    image1.frameRatio = 20.0;
    
    FMMarkerComposition *com1 = [[FMMarkerComposition alloc] init];
    com1.frameRatio = 20.0;
    com1.backgroundColor = [UIColor colorR:204 G:233 B:253];
    
    FMMarkerText *text1 = [[FMMarkerText alloc] init];
    text1.text = @"温度()";
    text1.font = [UIFont fontWithName:@"Heiti SC" size:14];
    text1.fillColor = [UIColor colorWithHexString:@"#ff00ff" alpha:1];
    text1.strokeColor = [UIColor colorWithHexString:@"#ff00ff" alpha:1];
    FMMarkerText *text2 = [[FMMarkerText alloc] init];
    text2.text = @"45";
    text2.font = [UIFont systemFontOfSize:14];
    text2.fillColor = [UIColor colorWithHexString:@"#CD564F" alpha:1];
//    text2.fillColor = [UIColor redColor];
//    text2.strokeColor = [UIColor greenColor];
//    text2.strokeWidth = 1.0;
//    text2.backgroundColor = [UIColor yellowColor];
    text2.frameRatio = 1;
    
    FMMarkerComposition *com11 = [[FMMarkerComposition alloc] init];
    com11.layoutMode = FMMarkerCompositionLayoutMode_VERTICAL;
    com11.backgroundColor = [UIColor colorR:204 G:233 B:253];
    [com11 addMarkerContent:text1 name:@"" space:5];
    [com11 addMarkerContent:text2 name:@"" space:10];
    [com1 addMarkerContent:image1 name:@"" space:10];
    [com1 addMarkerContent:com11 name:@"" space:10];
    
    
    FMMarkerImage *image2 = [[FMMarkerImage alloc] init];
    image2.image = [UIImage imageNamed:@"night"];
    image2.imageSize = CGSizeMake(60, 60);
    image2.backgroundColor = [UIColor colorR:204 G:233 B:253];
    image2.frameRatio = 10.0;
    
    FMMarkerComposition *com2 = [[FMMarkerComposition alloc] init];
    com2.frameRatio = 16.0;
    com2.backgroundColor = [UIColor colorR:204 G:233 B:253];
    
    text3 = [[FMMarkerText alloc] init];
    text3.text = @"湿度()";
//    text3.fillColor = [UIColor colorWithHexString:@"#336973" alpha:1];
    text3.font = [UIFont fontWithName:@"Heiti SC" size:14];
    text3.fillColor = [UIColor redColor];
    FMMarkerText *text4 = [[FMMarkerText alloc] init];
    text4.text = @"45";
    text4.font = [UIFont systemFontOfSize:14];
    
    FMMarkerComposition *com21 = [[FMMarkerComposition alloc] init];
    com21.layoutMode = FMMarkerCompositionLayoutMode_VERTICAL;
    com21.backgroundColor = [UIColor colorR:204 G:233 B:253];
    [com21 addMarkerContent:text3 name:@"" space:5];
    [com21 addMarkerContent:text4 name:@"" space:10];
    [com2 addMarkerContent:image2 name:@"" space:10];
    [com2 addMarkerContent:com21 name:@"" space:10];
    
    com.layoutMode = FMMarkerCompositionLayoutMode_VERTICAL;
    [com addMarkerContent:com1 name:@"" space:10];
    [com addMarkerContent:com2 name:@"" space:10];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, com.size.width, com.size.height)];
    imageView.image = com.image;
    [self.view addSubview:imageView];
    [com.image addObserver:self forKeyPath:@"imageChange" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",change);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 1;
    text3.text = @(i++).stringValue;
    imageView.image = com.image;
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
    imageView.image = [UIImage imageNamed:@"test.jpg"];
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
+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) green:((rgbValue & 0xFF00) >> 8) blue:(rgbValue & 0xFF) alpha:1.0];
}

@end
