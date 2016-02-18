//
//  UIColor+Night.m
//  DKNightVersion
//
//  Created by 施孝达 on 16/2/18.
//  Copyright © 2016年 DeltaX. All rights reserved.
//

#import "UIColor+Night.h"
#import "DKNightVersionManager.h"

#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define greenTitleColor RGBColor(52,192,131)
#define blackTitleColor RGBColor(0,0,0)
#define grayTitleColor  RGBColor(146,146,146)
#define whiteTitleColor  RGBColor(255,255,255)
#define lightGrayTitleColor  RGBColor(128,128,128)
#define lightYellowTitleColor  RGBColor(242,182,9)
#define lightBlueTitleColor RGBColor(80, 125, 175)
#define smRedColor RGBColor(255, 96, 82)

@implementation UIColor (Night)

- (UIColor *)changeColor
{
    switch ([DKNightVersionManager currentThemeVersion]) {
        case DKThemeVersionNormal:
            if ([self isEqual:[UIColor darkGrayColor]]) {
                return [UIColor redColor];
            }
            break;
        case DKThemeVersionNight:
            if ([self isEqual:[UIColor redColor]]) {
                return [UIColor darkGrayColor];
            }
            break;
        default:
            return blackTitleColor;
            break;
    }
    return blackTitleColor;
//    if ([self isEqual:[UIColor darkGrayColor]]) {
//        return [UIColor redColor];
//    } else if ([self isEqual:[UIColor darkGrayColor]]) {
//        return [UIColor redColor];
//    }
//    return [UIColor redColor];
}

@end
