//
//  UIImageView+Night.m
//  DKNightVersion
//
//  Created by Draveness on 15/12/10.
//  Copyright © 2015年 DeltaX. All rights reserved.
//

#import "UIImageView+Night.h"
#import "NSObject+Night.h"
#import <objc/runtime.h>

@interface NSObject ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UIImageView (Night)

//+ (void)load {
//    SEL selectors[] = {
////        @selector(setImage:),
//    };
//    
//    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
//        SEL originalSelector = selectors[index];
//        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
//        Method originalMethod = class_getInstanceMethod(self, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}

//- (void)sm_hook_setImage:(UIImage *)image
//{
//    if  (!image)
//    {
//        return;
//    }
//    if (self.dk_imagePicker && self.dk_imagePicker() == image)
//    {
//        [self sm_hook_setImage:image];
//    }
//    else
//    {
//        self.dk_imagePicker = [DKImage defaultImagePicker:image];
//    }
//}

- (instancetype)dk_initWithImagePicker:(DKImagePicker)picker {
    UIImageView *imageView = [self initWithImage:picker()];
    imageView.dk_imagePicker = [picker copy];
    return imageView;
}

- (DKImagePicker)dk_imagePicker {
    return objc_getAssociatedObject(self, @selector(dk_imagePicker));
}

- (void)setDk_imagePicker:(DKImagePicker)picker {
    objc_setAssociatedObject(self, @selector(dk_imagePicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = picker();
    [self.pickers setValue:[picker copy] forKey:@"setImage:"];
}

@end
