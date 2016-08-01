//
//  UIImage+STImage.m
//  截屏并设置磨砂效果
//
//  Created by leergou on 16/8/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "UIImage+STImage.h"

@implementation UIImage (STImage)

#pragma mark - 截屏

+ (UIImage *)screenShot{
    
    // 开启图片上下文
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    // 获取当前窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 获取上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
    // 将view 渲染到上下文
    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 图片压缩方法
- (UIImage *)compressImageTo:(CGFloat)width{
    
    if (self.size.width <= width) {
        
        return self;
    }
    
    // 获取图片的最终高度
    CGFloat height = width * (self.size.height/self.size.width);
    // 设置 rect
    CGRect rect = CGRectMake(0, 0, width, height);
    // 开启图片上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 将图片渲染到上下文中
    [self drawInRect:rect];
    // 从上下文获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    return image;
}




@end
