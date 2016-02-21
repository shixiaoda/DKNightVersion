//
//  UIProgressView+Night.m
//  UIProgressView+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIProgressView+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UIProgressView ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UIProgressView (Night)

+ (void)load {
    SEL selectors[] = {
    @selector(setProgressTintColor:),
	@selector(setTrackTintColor:),
	
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (void)sm_hook_setProgressTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_progressTintColorPicker && self.dk_progressTintColorPicker() == color)
    {
        [self sm_hook_setProgressTintColor:color];
    }
    else
    {
        self.dk_progressTintColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setTrackTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_trackTintColorPicker && self.dk_trackTintColorPicker() == color)
    {
        [self sm_hook_setTrackTintColor:color];
    }
    else
    {
        self.dk_trackTintColorPicker = [DKColor defaultColorPicker:color];
    }
}



- (DKColorPicker)dk_progressTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_progressTintColorPicker));
}

- (void)setDk_progressTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_progressTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self sm_hook_setProgressTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"setProgressTintColor:"];
}

- (DKColorPicker)dk_trackTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_trackTintColorPicker));
}

- (void)setDk_trackTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_trackTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self sm_hook_setTrackTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"setTrackTintColor:"];
}


@end
