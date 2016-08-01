//
//  UIImage+STImage.h
//  截屏并设置磨砂效果
//
//  Created by leergou on 16/8/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (STImage)

- (UIImage *)compressImageTo:(CGFloat)width;

+ (UIImage *)screenShot;

@end
