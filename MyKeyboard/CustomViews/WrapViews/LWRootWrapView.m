//
// Created by luowei on 15/8/5.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWRootWrapView.h"
#import "LWSettingPopView.h"
#import "LWDefines.h"
#import "LWKeyboardConfig.h"
#import "LWOftenWordsPopView.h"


@interface LWRootWrapView ()
@property(nonatomic, strong) LWSettingPopView *settingPopView;
@property(nonatomic, strong) LWOftenWordsPopView *oftenWordsPop;
@end

@implementation LWRootWrapView {

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if(_settingPopView){
        _settingPopView.frame = CGRectMake(0, TopView_H, self.frame.size.width, self.frame.size.height - TopView_H);
    }
    if(_oftenWordsPop){
        _oftenWordsPop.frame = CGRectMake(0, TopView_H, self.frame.size.width, self.frame.size.height - TopView_H);
    }
    
}

/**
* 添加logoPop弹窗
*/
- (void)addLogoPop:(UIView *)btn {
    _settingPopView = [LWSettingPopView new];
    [self addSubview:_settingPopView];

    _settingPopView.frame = CGRectMake(0, TopView_H, self.frame.size.width, self.frame.size.height - TopView_H);
}

/**
* 删除logoPop弹窗
*/
- (void)removeLogoPop {
    [_settingPopView removeFromSuperview];
    _settingPopView = nil;
}

/**
* 添加表情键盘Pop
*/
- (void)addEmojiPop:(UIView *)btn {

}

/**
* 删除表情键盘Pop
*/
- (void)removeEmojiPop {

}

/**
* 添加常用语Pop
*/
- (void)addOftenWordsPop:(UIView *)btn {
    if(!_oftenWordsPop){
        CGRect oftenWordsFrame = CGRectMake(0, TopView_H, self.frame.size.width, self.frame.size.height - TopView_H);
        _oftenWordsPop = [[LWOftenWordsPopView alloc] initWithFrame:oftenWordsFrame];
        [self addSubview:_oftenWordsPop];
    }

}

/**
* 删除常用语Pop
*/
- (void)removeOftenWordsPop {
    [_oftenWordsPop removeFromSuperview];
    _oftenWordsPop = nil;
}

/**
* 添加切换键盘Pop
*/
- (void)addNextPop:(UIView *)btn {

}

/**
* 删除切换键盘Pop
*/
- (void)removeNextPop {

}

/**
* 添加全键盘按键Pop
*/
- (void)addFullCharBtnPop:(UIView *)btn {

}

/**
* 删除全键盘按键Pop
*/
- (void)removeFullCharBtnPop {

}
@end