//
//  UIView+SaveImageWithUIView.m
//  xx
//
//  Created by user on 2018/1/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIView+SaveImageWithUIView.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (SaveImageWithUIView)

- (UIImage *)saveImageWithScale:(float)scale

{
    
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
