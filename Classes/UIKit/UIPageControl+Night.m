//
//  UIPageControl+Night.m
//  UIPageControl+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIPageControl+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UIPageControl ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UIPageControl (Night)

+ (void)load {
    SEL selectors[] = {
    @selector(setPageIndicatorTintColor:),
	@selector(setCurrentPageIndicatorTintColor:),
	
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (void)sm_hook_setPageIndicatorTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_pageIndicatorTintColorPicker && self.dk_pageIndicatorTintColorPicker() == color)
    {
        [self sm_hook_setPageIndicatorTintColor:color];
    }
    else
    {
        self.dk_pageIndicatorTintColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setCurrentPageIndicatorTintColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_currentPageIndicatorTintColorPicker && self.dk_currentPageIndicatorTintColorPicker() == color)
    {
        [self sm_hook_setCurrentPageIndicatorTintColor:color];
    }
    else
    {
        self.dk_currentPageIndicatorTintColorPicker = [DKColor defaultColorPicker:color];
    }
}



- (DKColorPicker)dk_pageIndicatorTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_pageIndicatorTintColorPicker));
}

- (void)setDk_pageIndicatorTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_pageIndicatorTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self sm_hook_setPageIndicatorTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"setPageIndicatorTintColor:"];
}

- (DKColorPicker)dk_currentPageIndicatorTintColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_currentPageIndicatorTintColorPicker));
}

- (void)setDk_currentPageIndicatorTintColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_currentPageIndicatorTintColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self sm_hook_setCurrentPageIndicatorTintColor:picker()];
    [self.pickers setValue:[picker copy] forKey:@"setCurrentPageIndicatorTintColor:"];
}


@end
