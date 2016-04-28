//
//  UIImage+TintColor.m
//  RRJK
//
//  Created by LCS on 15/11/12.
//  Copyright (c) 2015年 Bingo. All rights reserved.
//


//   原文地址http://www.onevcat.com/2013/04/using-blending-in-ios/

#import "UIImage+TintColor.h"

@implementation UIImage (TintColor)

-(instancetype)imageWithTintColor:(UIColor *) tintColor{
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}


@end
