//
//  UIImage+Color.h
//  MyInputMethod
//
//  Created by luowei on 15/8/11.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Color)

/**
* 给指定的图片染色
*/
- (UIImage *)imageWithOverlayColor:(UIColor *)color;

@end
