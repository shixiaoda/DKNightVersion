//
//  UISwitch+Night.m
//  UISwitch+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UISwitch+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UISwitch ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UISwitch (Night)

+ (void)load {
    SEL selectors[] = {
    @selector(setOnTintColor:),
	@selector(setThumbTintColor:),
	
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (void)sm_hook_setOnTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_onTintColorPicker && self.dk_onTintColorPicker() == color)
    {
        [self sm_hook_setOnTintColor:color];
    }
    else
    {
        self.dk_onTintColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setThumbTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_thumbTintColorPicker && self.dk_thumbTintColorPicker() == color)
    {
        [self sm_hook_setThumbTintColor:color];
    }
    else
    {
        self.dk_thumbTintColorPicker = [DKColor defaultColorPicker:color];
    }
}



- (DKColorPicker)dk_onTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_onTintColorPicker));
}

- (void)setDk_onTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_onTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.onTintColor = picker();
    [self.pickers setValue:[picker copy] forKey:@"setOnTintColor:"];
}

- (DKColorPicker)dk_thumbTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_thumbTintColorPicker));
}

- (void)setDk_thumbTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_thumbTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.thumbTintColor = picker();
    [self.pickers setValue:[picker copy] forKey:@"setThumbTintColor:"];
}


@end
