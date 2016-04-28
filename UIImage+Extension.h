//
//  UIImage+Extension.h
//  网易新闻
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)imageWithColor:(UIColor *)color;

//  拉伸图片
+ (UIImage *)strechImage:(NSString *)imageName;

//  缩放图片
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

@end
