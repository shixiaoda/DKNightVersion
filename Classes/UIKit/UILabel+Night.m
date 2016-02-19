//
//  UILabel+Night.m
//  UILabel+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UILabel+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UILabel ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UILabel (Night)

+ (void)load {
    SEL selectors[] = {
    @selector(setTextColor:),
	@selector(setShadowColor:),
	@selector(setHighlightedTextColor:),
	
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


- (void)sm_hook_setTextColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_textColorPicker && self.dk_textColorPicker() == color)
    {
        [self sm_hook_setTextColor:color];
    }
    else
    {
        self.dk_textColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setShadowColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_shadowColorPicker && self.dk_shadowColorPicker() == color)
    {
        [self sm_hook_setShadowColor:color];
    }
    else
    {
        self.dk_shadowColorPicker = [DKColor defaultColorPicker:color];
    }
}

- (void)sm_hook_setHighlightedTextColor:(UIColor *)color {
    if  (!color)
    {
        return;
    }
    if (self.dk_highlightedTextColorPicker && self.dk_highlightedTextColorPicker() == color)
    {
        [self sm_hook_setHighlightedTextColor:color];
    }
    else
    {
        self.dk_highlightedTextColorPicker = [DKColor defaultColorPicker:color];
    }
}



- (DKColorPicker)dk_textColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_textColorPicker));
}

- (void)setDk_textColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_textColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.textColor = picker();
    [self.pickers setValue:[picker copy] forKey:@"setTextColor:"];
}

- (DKColorPicker)dk_shadowColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_shadowColorPicker));
}

- (void)setDk_shadowColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_shadowColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.shadowColor = picker();
    [self.pickers setValue:[picker copy] forKey:@"setShadowColor:"];
}

- (DKColorPicker)dk_highlightedTextColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_highlightedTextColorPicker));
}

- (void)setDk_highlightedTextColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_highlightedTextColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.highlightedTextColor = picker();
    [self.pickers setValue:[picker copy] forKey:@"setHighlightedTextColor:"];
}


@end
