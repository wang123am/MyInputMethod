//
//  BaseKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "BaseKBBtn.h"
#import "KeyboardConfiguration.h"
#import "Defines.h"


@interface BaseKBBtn ()

@end

@implementation BaseKBBtn{
    CALayer *shadowlayer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubViews];
    }

    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews {
    self.translatesAutoresizingMaskIntoConstraints = YES;
    CGRect frame = self.frame;
    CGRect layerframe = self.layer.frame;
    //设置btn的绘制(显示)区域之间的半倍间隙
    self.layer.frame = CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL);
    
    CGRect anewframe = self.frame;
    CGRect anewlayerframe = self.layer.frame;

    //当前主题
    NSString *themeName = [KeyboardConfiguration currentTheme];

    //当有主题设置
    if(themeName){
            UIImage *kbBtnImamge = [KeyboardConfiguration getBtnImageWithByName:themeName];
            self.layer.contents = (__bridge id)kbBtnImamge.CGImage;
            self.layer.contentsScale = [[UIScreen mainScreen] scale];

        }else{
            //当没有设置主题

            // 给按钮添加阴影层
            shadowlayer = [CALayer layer];
            shadowlayer.contentsScale = self.layer.contentsScale;
            shadowlayer.backgroundColor = COLOR_SHADOWLAYER;
            shadowlayer.cornerRadius = R_SHADOWLAYER;
            shadowlayer.frame = CGRectOffset(self.layer.frame, 0, OFFSET_SHADOWLAYER);
        [self.layer addSublayer:shadowlayer];
        }
}


- (void)layoutSubviews {
    [super layoutSubviews]; 
    
    shadowlayer.frame = CGRectOffset(self.layer.frame, 0, OFFSET_SHADOWLAYER);
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {

}

@end
