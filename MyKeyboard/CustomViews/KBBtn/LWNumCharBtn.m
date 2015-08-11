//
//  LWNumKeyBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/8/4.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWNumCharBtn.h"
#import "LWDefines.h"

@implementation LWNumCharBtn {
    NSString *mainText;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }

    return self;
}

/**
* 设置子视图
*/
- (void)setupSubViews {
    [super setupSubViews];

    //    [self setText:nil topText:nil];
}

/**
* layout 子视图
*/
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.mainLabel sizeToFit];
    
    //subView的中心点位置根据boundSize来设置
    CGSize boundSize = self.contentView.bounds.size;
    CGSize mainLbSize = self.mainLabel.bounds.size;
    self.mainLabel.bounds = CGRectMake(0, 0, mainLbSize.width, mainLbSize.height);
    self.mainLabel.center = CGPointMake(boundSize.width/2, boundSize.height/2);
    
//    [super layoutSubviews];
}

/**
* 设置按键主标签与上标签字符内容
*/
- (void)setTopText:(NSString *)upText text:(NSString *)text {
    
    if (text) {
        if (!self.mainLabel) {
            CGSize boundSize = self.contentView.bounds.size;
            self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, boundSize.height / 8, boundSize.width, boundSize.height * 3 / 4)];
            self.mainLabel.center = CGPointMake(boundSize.width/2, boundSize.height/2);
            self.mainLabel.textAlignment = NSTextAlignmentCenter;
            self.mainLabel.font = MAINTEXT_FONT;
            self.mainLabel.textColor = COLOR_MAINTEXT;
            [self.contentView addSubview:self.mainLabel];
        }
        self.mainLabel.text = text;
    } else {
        [self.mainLabel removeFromSuperview];
        self.mainLabel = nil;
    }
    mainText = text;

}

/**
* 给按键主标签设置内容,并移除上标签内容
*/
- (void)setText:(NSString *)text {
    [self setTopText:nil text:text];
}

/**
* 获得按键主标签内容
*/
- (NSString *)text {
    return self.mainLabel ? self.mainLabel.text : mainText;
}


@end



@implementation LWNumSymbolCharBtn

@end
