//
//  UIViewController+Extension.m
//  DCURLRouterDemo
//
//  Created by arduomeng on 16/12/20.
//  Copyright © 2016年 DarielChen. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

+ (UIViewController*)currentViewController {
    UIViewController* rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self currentViewControllerFrom:rootViewController];
}

// 通过递归拿到当前控制器
+ (UIViewController*)currentViewControllerFrom:(UIViewController*)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
    } // 如果传入的控制器是导航控制器,则返回最后一个
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
    } // 如果传入的控制器是tabBar控制器,则返回选中的那个
    else if(viewController.presentedViewController != nil) {
        return [self currentViewControllerFrom:viewController.presentedViewController];
    } // 如果传入的控制器发生了modal,则就可以拿到modal的那个控制器
    else {
        return viewController;
    }
}


@end
