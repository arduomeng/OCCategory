//
//  UIImage+StretchLeftAndRight.m
//  xxx
//
//  Created by arduomeng on 16/11/7.
//  Copyright © 2016年 arduomeng. All rights reserved.
//

#import "UIImage+StretchLeftAndRight.h"

@implementation UIImage (StretchLeftAndRight)

- (UIImage *)stretchLeftAndRightWithContainerSize:(CGSize)size
{
    CGSize imageSize = self.size;
    CGSize bgSize = size;
    
    //1.第一次拉伸右边 保护左边
    UIImage *image = [self resizableImageWithCapInsets:UIEdgeInsetsMake(imageSize.height * 0.45, imageSize.width * 0.7, imageSize.height * 0.45, imageSize.width * 0.2) resizingMode:UIImageResizingModeStretch];
    
    //第一次拉伸的距离之后图片总宽度
    CGFloat tempWidth = (bgSize.width)/2 + imageSize.width/2;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tempWidth, bgSize.height), NO, [UIScreen mainScreen].scale);
    
    [image drawInRect:CGRectMake(0, 0, tempWidth, bgSize.height)];
    
    //拿到拉伸过的图片
    UIImage *firstStrechImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //2.第二次拉伸左边 保护右边
    UIImage *secondStrechImage = [firstStrechImage resizableImageWithCapInsets:UIEdgeInsetsMake(firstStrechImage.size.height * 0.45, firstStrechImage.size.width * 0.05, firstStrechImage.size.height * 0.45, firstStrechImage.size.width * 0.9) resizingMode:UIImageResizingModeStretch];
    
    return secondStrechImage;
}

@end
