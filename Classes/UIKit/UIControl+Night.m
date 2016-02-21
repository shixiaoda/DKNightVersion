//
//  UIControl+Night.m
//  UIControl+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIControl+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UIControl ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UIControl (Night)

+ (void)load {
    SEL selectors[] = {
    @selector(setTintColor:),
	
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (void)sm_hook_setTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_tintColorPicker && self.dk_tintColorPicker() == color)
    {
        [self sm_hook_setTintColor:color];
    }
    else
    {
        self.dk_tintColorPicker = [DKColor defaultColorPicker:color];
    }
}



- (DKColorPicker)dk_tintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_tintColorPicker));
}

- (void)setDk_tintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_tintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self sm_hook_setTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"setTintColor:"];
}


@end
