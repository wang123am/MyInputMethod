//
//  LWBaseKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWBaseKeyboard.h"
#import "Defines.h"

@implementation LWBaseKeyboard

//设置键盘
- (void)setupKeyboard:(KBKeyboardType)keyboardType{

}


-(void)setupBackgroundColor:(UIColor *)color{
    self.backgroundColor = color;
}

-(void)setupBackground:(UIImage *)image{
    self.layer.contents = (__bridge id)image.CGImage;
    self.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.layer.contentsGravity = kCAGravityResizeAspectFill;
}


@end
