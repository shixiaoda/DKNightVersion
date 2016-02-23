//
//  DKImage.m
//  DKNightVersion
//
//  Created by Draveness on 15/12/10.
//  Copyright © 2015年 DeltaX. All rights reserved.
//

#import "DKImage.h"
#import "DKNightVersionManager.h"

@implementation DKImage

DKImagePicker DKImageWithNames(NSString *normal, NSString *night) {
    return [DKImage pickerWithNormalImage:[UIImage imageNamed:normal] nightImage:[UIImage imageNamed:night]];
}

DKImagePicker DKImageWithImages(UIImage *normal, UIImage *night) {
    return [DKImage pickerWithNormalImage:normal nightImage:night];
}

+ (DKImagePicker)pickerWithNormalImage:(UIImage *)normalImage nightImage:(UIImage *)nightImage {
    NSAssert(normalImage, @"- pickerWithNormalImage:nightImage: lack parameter normalImage");
    NSAssert(nightImage, @"- pickerWithNormalImage:nightImage: lack parameter nightImage");
    return ^() {
        return [DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal ? normalImage : nightImage;
    };
}

+ (DKImagePicker)pickerWithImage:(UIImage *)image {
    return ^() {
        return image;
    };
}

+ (DKImagePicker)imageNamed:(NSString *)name {
    return [self pickerWithImage:[UIImage imageNamed:name]];
}

//+ (DKImagePicker)defaultImagePicker:(UIImage *)image
//{
//    if ([image isMemberOfClass:[UIImage class]])
//    {
//        return DKImageWithImages(image,[UIImage imageNamed:@"night1"]);
//    }
//    else
//    {
//        switch ([DKNightVersionManager currentThemeVersion]) {
//            case DKThemeVersionNormal:
//                if ([image isEqual:[UIImage imageNamed:@"normal1"]]) {
//                    return DKImageWithImages(image,[UIImage imageNamed:@"night1"]);
//                }
//                break;
//            case DKThemeVersionNight:
//                if ([image isEqual:[UIImage imageNamed:@"night1"]]) {
//                    return DKImageWithImages(image,[UIImage imageNamed:@"normal1"]);;
//                }
//                break;
//            default:
//                return DKImageWithImages(image,image);
//                break;
//        }
//        
//        return DKImageWithImages(image,image);
//    }
//
//}
@end
