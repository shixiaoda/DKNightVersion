//
//  UITabBar+Night.m
//  UITabBar+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UITabBar+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UITabBar ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UITabBar (Night)

+ (void)load {
    SEL selectors[] = {
    @selector(setBarTintColor:),
	
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (void)sm_hook_setBarTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_barTintColorPicker && self.dk_barTintColorPicker() == color)
    {
        [self sm_hook_setBarTintColor:color];
    }
    else
    {
        self.dk_barTintColorPicker = [DKColor defaultColorPicker:color];
    }
}



- (DKColorPicker)dk_barTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_barTintColorPicker));
}

- (void)setDk_barTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_barTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self sm_hook_setBarTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"setBarTintColor:"];
}


@end
