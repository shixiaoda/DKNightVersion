//
//  UITableView+Night.m
//  UITableView+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UITableView+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UITableView ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKPicker> *pickers;

@end

@implementation UITableView (Night)

+ (void)load {
    SEL selectors[] = {
      @selector(setSeparatorColor:),
	  
    };

    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



- (void)sm_hook_setSeparatorColor:(UIColor *)color {
    if (!color || [NSStringFromClass(self.window.class) isEqualToString:UIRemoteKeyboardWindow])
    {
        [self sm_hook_setSeparatorColor:color];
        return;
    }
    if (self.dk_separatorColorPicker && [self.dk_separatorColorPicker(YES) isEqual:color])
    {
        [self sm_hook_setSeparatorColor:self.dk_separatorColorPicker(NO)];
    }
    else
    {
        self.dk_separatorColorPicker = [DKColor defaultColorPicker:color];
    }
}




- (DKColorPicker)dk_separatorColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_separatorColorPicker));
}

- (void)setDk_separatorColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_separatorColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);

    [self sm_hook_setSeparatorColor:picker(NO)];
    [self.pickers setValue:[picker copy] forKey:@"sm_hook_setSeparatorColor:"];
}
    


@end
