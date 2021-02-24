//
//  UIViewController+XHNoPresent.m
//  DEMO_更换Icon
//
//  Created by douhuo on 2021/2/23.
//

#import "UIViewController+XHNoPresent.h"
#import <objc/runtime.h>

@implementation UIViewController (XHNoPresent)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oldPresent = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method xhPresent = class_getInstanceMethod(self.class, @selector(xh_presentViewController:animated:completion:));
        
        method_exchangeImplementations(oldPresent, xhPresent);
    });
}

- (void)xh_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController * alertVC = (UIAlertController *)viewControllerToPresent;
        if (alertVC.title == nil && alertVC.message == nil) {
            return;
        }
    }
    [self xh_presentViewController:viewControllerToPresent animated:flag completion:completion];
}



@end
