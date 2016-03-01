//
//  DKColor.m
//  DKNightVersion
//
//  Created by Draveness on 15/12/9.
//  Copyright © 2015年 DeltaX. All rights reserved.
//

#import "DKColor.h"
#import "DKNightVersionManager.h"

#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//================================白天模式====================================
//白色
#define whiteTitleColor  RGBColor(255,255,255)
//黑灰
#define blackTitleColor RGBColor(0,0,0)
#define grayDarkTitleColor  blackTitleColor
#define lightBlackTitleColor RGBColor(46,46,46)
//灰白
#define NavTopBarLineColor RGBColor(227,228,230)
//========================================夜间模式==========================================
#define night_whiteColor RGBColor(55,55,55)
#define night_whiteColor2 RGBColor(231,255,255)
#define night_blackColor RGBColor(144,165,176)
//********************************************************************************

@implementation DKColor

DKColorPicker DKColorWithRGB(NSUInteger normal, NSUInteger night) {
    UIColor *normalColor = [UIColor colorWithRed:((float)((normal & 0xFF0000) >> 16))/255.0 green:((float)((normal & 0xFF00) >> 8))/255.0 blue:((float)(normal & 0xFF))/255.0 alpha:1.0];
    UIColor *nightColor = [UIColor colorWithRed:((float)((night & 0xFF0000) >> 16))/255.0 green:((float)((night & 0xFF00) >> 8))/255.0 blue:((float)(night & 0xFF))/255.0 alpha:1.0];
    return DKColorWithColors(normalColor, nightColor);
}

DKColorPicker DKColorWithColors(UIColor *normalColor, UIColor *nightColor) {
    return ^() {
        return [DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal ? normalColor : nightColor;
    };
}

DKColorPicker DKColorWithThreeColors(UIColor *normalColor, UIColor *nightColor, UIColor *testColor)
{
    return ^() {
        return [DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal ? normalColor :
        ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight ? nightColor : testColor);
    };
}

+ (DKColorPicker)pickerWithNormalColor:(UIColor *)normalColor nightColor:(UIColor *)nightColor {
    return ^() {
        return [DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal ? normalColor : nightColor;
    };
}

+ (DKColorPicker)pickerWithUIColor:(UIColor *)color {
    return ^() {
        return color;
    };
}

+ (DKColorPicker)blackColor {
    return [self pickerWithUIColor:[UIColor blackColor]];
}

+ (DKColorPicker)darkGrayColor {
    return [self pickerWithUIColor:[UIColor darkGrayColor]];
}

+ (DKColorPicker)lightGrayColor {
    return [self pickerWithUIColor:[UIColor lightGrayColor]];
}

+ (DKColorPicker)whiteColor {
    return [self pickerWithUIColor:[UIColor whiteColor]];
}

+ (DKColorPicker)grayColor {
    return [self pickerWithUIColor:[UIColor grayColor]];
}

+ (DKColorPicker)redColor {
    return [self pickerWithUIColor:[UIColor redColor]];
}

+ (DKColorPicker)greenColor {
    return [self pickerWithUIColor:[UIColor greenColor]];
}

+ (DKColorPicker)blueColor {
    return [self pickerWithUIColor:[UIColor blueColor]];
}

+ (DKColorPicker)cyanColor {
    return [self pickerWithUIColor:[UIColor cyanColor]];
}

+ (DKColorPicker)yellowColor {
    return [self pickerWithUIColor:[UIColor yellowColor]];
}

+ (DKColorPicker)magentaColor {
    return [self pickerWithUIColor:[UIColor magentaColor]];
}

+ (DKColorPicker)orangeColor {
    return [self pickerWithUIColor:[UIColor orangeColor]];
}

+ (DKColorPicker)purpleColor {
    return [self pickerWithUIColor:[UIColor purpleColor]];
}

+ (DKColorPicker)brownColor {
    return [self pickerWithUIColor:[UIColor brownColor]];
}

+ (DKColorPicker)clearColor {
    return [self pickerWithUIColor:[UIColor clearColor]];
}

+ (DKColorPicker)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha {
    return [self pickerWithUIColor:[UIColor colorWithWhite:white alpha:alpha]];
}

+ (DKColorPicker)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha {
    return [self pickerWithUIColor:[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha]];
}

+ (DKColorPicker)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self pickerWithUIColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
}

+ (DKColorPicker)colorWithCGColor:(CGColorRef)cgColor {
    return [self pickerWithUIColor:[UIColor colorWithCGColor:cgColor]];
}

+ (DKColorPicker)colorWithPatternImage:(UIImage *)image {
    return [self pickerWithUIColor:[UIColor colorWithPatternImage:image]];
}

#if __has_include(<CoreImage/CoreImage.h>)
+ (DKColorPicker)colorWithCIColor:(CIColor *)ciColor NS_AVAILABLE_IOS(5_0) {
    return [self pickerWithUIColor:[UIColor colorWithCIColor:ciColor]];
}
#endif

+ (DKColorPicker)defaultColorPicker:(UIColor *)color
{
    return [DKColor defaultColorPicker:color isText:NO];
}

+ (DKColorPicker)defaultColorPicker:(UIColor *)color isText:(BOOL)isText
{
//    UIColor *color1 = [UIColor whiteColor];
//    UIColor *color2 = [UIColor blackColor];
//    UIColor *color3 = [UIColor grayColor];
//    
//    UIColor *color4 = RGBColor(0, 0, 0);
//    UIColor *color5 = RGBColor(255, 255, 255);
//
//    
//    
//    const CGFloat * com1 =  CGColorGetComponents(color1.CGColor);
//    NSLog(@" whiteColor %f %f %f %f",com1[0],com1[1],com1[2],com1[3]);
//    const CGFloat * com2 =CGColorGetComponents(color2.CGColor);
//    NSLog(@" blackColor %f %f %f %f",com2[0],com2[1],com2[2],com2[3]);
//    const CGFloat * com3 = CGColorGetComponents(color3.CGColor);
//    NSLog(@" grayColor %f %f %f %f",com3[0],com3[1],com3[2],com3[3]);
//    const CGFloat * com4 = CGColorGetComponents(color4.CGColor);
//    NSLog(@"0 0 0 1%f %f %f %f",com4[0],com4[1],com4[2],com4[3]);
//
//    const CGFloat * com5 = CGColorGetComponents(color5.CGColor);
//    NSLog(@"255 255 255 1%f %f %f %f",com5[0],com5[1],com5[2],com5[3]);
//    
//    if ([color5 isEqual:color1]) {
//        NSLog(@"YES");
//    }
//    if (color) {
//        const CGFloat *com1 = CGColorGetComponents(color.CGColor);
//        NSString *colorCode = [NSString stringWithFormat:@"%d-%d-%d-%d",(int)(com1[0]*255),(int)(com1[1]*255),(int)(com1[2]*255),(int)(com1[3]*255)];
//        NSLog(@"colorCode2 = %@",colorCode);
//        if ([colorCode isEqualToString:@"231-255-255-255"])
//        {
//            NSLog(@"%s %d %@",__func__, __LINE__, NSStringFromClass([self class]) );
//        }
//
//    }
    
    if ([color isEqual:[UIColor whiteColor]] )//(255,255,0,0)
    {
        return DKColorWithColors(color,night_whiteColor);
    }
    else if ([color isEqual:blackTitleColor]
              || [color isEqual:lightBlackTitleColor]
              || [color isEqual:whiteTitleColor]
    )
    {
        return DKColorWithColors(color,night_blackColor);
    }
    
    return DKColorWithColors(color,color);
}

+ (DKColorPicker)defaultTitleColorPicker:(UIColor *)color
{
    if ([color isEqual:whiteTitleColor])//255,255,255,255
    {
        return DKColorWithColors(color,night_whiteColor2);
    }
    else if ([color isEqual:[UIColor whiteColor]])
    {
        return DKColorWithColors(color,night_whiteColor2);
    }
    
    return DKColorWithColors(color,color);
}


@end

