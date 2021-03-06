//
//  DKColor.h
//  DKNightVersion
//
//  Created by Draveness on 15/12/9.
//  Copyright © 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIColor *(^DKColorPicker)(BOOL bOriginal);

DKColorPicker DKColorWithRGB(NSUInteger normal, NSUInteger night);
DKColorPicker DKColorWithColors(UIColor *normalColor, UIColor *nightColor);
DKColorPicker DKColorWithThreeColors(UIColor *normalColor, UIColor *nightColor, UIColor *testColor);

@interface DKColor : NSObject

+ (DKColorPicker)pickerWithUIColor:(UIColor *)color;

+ (DKColorPicker)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
+ (DKColorPicker)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
+ (DKColorPicker)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (DKColorPicker)colorWithCGColor:(CGColorRef)cgColor;
+ (DKColorPicker)colorWithPatternImage:(UIImage *)image;
#if __has_include(<CoreImage/CoreImage.h>)
+ (DKColorPicker)colorWithCIColor:(CIColor *)ciColor NS_AVAILABLE_IOS(5_0);
#endif

+ (DKColorPicker)blackColor;
+ (DKColorPicker)darkGrayColor;
+ (DKColorPicker)lightGrayColor;
+ (DKColorPicker)whiteColor;
+ (DKColorPicker)grayColor;
+ (DKColorPicker)redColor;
+ (DKColorPicker)greenColor;
+ (DKColorPicker)blueColor;
+ (DKColorPicker)cyanColor;
+ (DKColorPicker)yellowColor;
+ (DKColorPicker)magentaColor;
+ (DKColorPicker)orangeColor;
+ (DKColorPicker)purpleColor;
+ (DKColorPicker)brownColor;
+ (DKColorPicker)clearColor;

+ (DKColorPicker)defaultColorPicker:(UIColor *)color;
+ (DKColorPicker)defaultTitleColorPicker:(UIColor *)color;

@end
