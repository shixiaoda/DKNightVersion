//
//  UIBarButtonItem+Night.m
//  UIBarButtonItem+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIBarButtonItem+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UIBarButtonItem ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UIBarButtonItem (Night)

+ (void)load {
    SEL selectors[] = {
      
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}




- (DKColorPicker)dk_tintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_tintColorPicker));
}

- (void)setDk_tintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_tintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);

    self.tintColor =  picker();
    [self.pickers setValue:[picker copy] forKey:@"setTintColor:"];
}
    


@end
