//
//  UISlider+Night.m
//  UISlider+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UISlider+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UISlider ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UISlider (Night)

+ (void)load {
    SEL selectors[] = {
      @selector(setMinimumTrackTintColor:),
	    @selector(setMaximumTrackTintColor:),
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

- (void)sm_hook_setMinimumTrackTintColor:(UIColor *)color {
    if (self.dk_minimumTrackTintColorPicker || !color)
    {
        [self sm_hook_setMinimumTrackTintColor:color];
    }
    else
    {
        self.dk_minimumTrackTintColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setMaximumTrackTintColor:(UIColor *)color {
    if (self.dk_maximumTrackTintColorPicker || !color)
    {
        [self sm_hook_setMaximumTrackTintColor:color];
    }
    else
    {
        self.dk_maximumTrackTintColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setThumbTintColor:(UIColor *)color {
    if (self.dk_thumbTintColorPicker || !color)
    {
        [self sm_hook_setThumbTintColor:color];
    }
    else
    {
        self.dk_thumbTintColorPicker = [DKColor defaultColorPicker:color];
    }
}


- (DKColorPicker)dk_minimumTrackTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_minimumTrackTintColorPicker));
}

- (void)setDk_minimumTrackTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_minimumTrackTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);

    [self sm_hook_setMinimumTrackTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"sm_hook_setMinimumTrackTintColor:"];
}
    

- (DKColorPicker)dk_maximumTrackTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_maximumTrackTintColorPicker));
}

- (void)setDk_maximumTrackTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_maximumTrackTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);

    [self sm_hook_setMaximumTrackTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"sm_hook_setMaximumTrackTintColor:"];
}
    

- (DKColorPicker)dk_thumbTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_thumbTintColorPicker));
}

- (void)setDk_thumbTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_thumbTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);

    [self sm_hook_setThumbTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"sm_hook_setThumbTintColor:"];
}
    


@end
