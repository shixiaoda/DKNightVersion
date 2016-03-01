//
//  UIButton+Night.m
//  DKNightVersion
//
//  Created by Draveness on 15/12/9.
//  Copyright © 2015年 DeltaX. All rights reserved.
//

#import "UIButton+Night.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *pickers;

@end

@implementation UIButton (Night)

+ (void)load {
    SEL selectors[] = {
        @selector(setTitleColor:forState:),
    };
    
    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sm_hook_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)sm_hook_setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    if (!color)
    {
        [self sm_hook_setTitleColor:color forState:state];
        return;
    }
    
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    NSMutableDictionary *dictionary = [self.pickers valueForKey:key];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    if (dictionary[key])
    {
        [self sm_hook_setTitleColor:color forState:state];
    }
    else
    {
        [self dk_setTitleColorPicker:[DKColor defaultTitleColorPicker:color] forState:state];
    }
}

- (void)dk_setTitleColorPicker:(DKColorPicker)picker forState:(UIControlState)state {
    [self sm_hook_setTitleColor:picker() forState:state];
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    NSMutableDictionary *dictionary = [self.pickers valueForKey:key];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[picker copy] forKey:NSStringFromSelector(@selector(sm_hook_setTitleColor:forState:))];
    [self.pickers setValue:dictionary forKey:key];
}

- (void)dk_setBackgroundImage:(DKImagePicker)picker forState:(UIControlState)state {
    [self setBackgroundImage:picker() forState:state];
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    NSMutableDictionary *dictionary = [self.pickers valueForKey:key];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[picker copy] forKey:NSStringFromSelector(@selector(setBackgroundImage:forState:))];
    [self.pickers setValue:dictionary forKey:key];
}

- (void)dk_setImage:(DKImagePicker)picker forState:(UIControlState)state {
    [self setImage:picker() forState:state];
    NSString *key = [NSString stringWithFormat:@"%@", @(state)];
    NSMutableDictionary *dictionary = [self.pickers valueForKey:key];
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    [dictionary setValue:[picker copy] forKey:NSStringFromSelector(@selector(setImage:forState:))];
    [self.pickers setValue:dictionary forKey:key];
}

- (void)night_updateColor {
    [self.pickers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary<NSString *, DKColorPicker> *dictionary = (NSDictionary *)obj;
            [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, DKColorPicker  _Nonnull picker, BOOL * _Nonnull stop) {
                UIControlState state = [key integerValue];
                [UIView animateWithDuration:DKNightVersionAnimationDuration
                                 animations:^{
                                     if ([selector isEqualToString:NSStringFromSelector(@selector(setTitleColor:forState:))]) {
                                         UIColor *resultColor = picker();
                                         [self setTitleColor:resultColor forState:state];
                                     } else if ([selector isEqualToString:NSStringFromSelector(@selector(setBackgroundImage:forState:))]) {
                                         UIImage *resultImage = ((DKImagePicker)picker)();
                                         [self setBackgroundImage:resultImage forState:state];
                                     } else if ([selector isEqualToString:NSStringFromSelector(@selector(setImage:forState:))]) {
                                         UIImage *resultImage = ((DKImagePicker)picker)();
                                         [self setImage:resultImage forState:state];
                                     } else if ([selector isEqualToString:NSStringFromSelector(@selector(sm_hook_setTitleColor:forState:))]) {
                                         UIColor *resultColor = picker();
                                         [self sm_hook_setTitleColor:resultColor forState:state];                                     }
                                 }];
            }];
        } else {
            SEL sel = NSSelectorFromString(key);
            DKColorPicker picker = (DKColorPicker)obj;
            UIColor *resultColor = picker();
            [UIView animateWithDuration:DKNightVersionAnimationDuration
                             animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                 [self performSelector:sel withObject:resultColor];
#pragma clang diagnostic pop
                             }];

        }
    }];
}

@end
