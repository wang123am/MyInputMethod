//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWFullCharBtn.h"
#import "LWDefines.h"


@implementation LWFullCharBtn {
    NSString *topText;
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

    //    //当约束情况,sizeToFit不生效，采用
    //    _topLabel.preferredMaxLayoutWidth = [_topLabel alignmentRectForFrame:_topLabel.frame].size.width;
    [super layoutSubviews];

    [_topLabel sizeToFit];
    [_mainLabel sizeToFit];

    //subView的中心点位置根据boundSize来设置
    CGSize boundSize = self.contentView.bounds.size;
    CGSize topLbSize = _topLabel.bounds.size;
    CGSize mainLbSize = _mainLabel.bounds.size;

    CGFloat mainLbY = boundSize.height / 4 + (boundSize.height * 3 / 4 - mainLbSize.height) / 2;
    _topLabel.frame = CGRectMake((boundSize.width - topLbSize.width) / 2, (CGFloat) (mainLbY - SPACE_TOP_MAIN - topLbSize.height), topLbSize.width, topLbSize.height);
    _mainLabel.frame = CGRectMake((boundSize.width - mainLbSize.width) / 2, mainLbY, mainLbSize.width, mainLbSize.height);

    [super layoutSubviews];
}

/**
* 设置按键主标签与上标签字符内容
*/
- (void)setTopText:(NSString *)upText text:(NSString *)text {

    CGSize boundSize = self.contentView.bounds.size;
    if (upText) {
        if (!_topLabel) {
            _topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, boundSize.width, boundSize.height / 4)];
            _topLabel.textAlignment = NSTextAlignmentCenter;
//                _topLabel.backgroundColor = [UIColor blueColor];
            _topLabel.font = TOPTEXT_FONT;
            [self.contentView addSubview:_topLabel];
        }
        _topLabel.text = upText;
    } else {
        [_topLabel removeFromSuperview];
        _topLabel = nil;
    }

    if (text) {
        if (!_mainLabel) {
            _mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, boundSize.height / 4, boundSize.width, boundSize.height * 3 / 4)];
            _mainLabel.textAlignment = NSTextAlignmentCenter;
//                _mainLabel.backgroundColor = [UIColor greenColor];
            _mainLabel.font = MAINTEXT_FONT;
            [self.contentView addSubview:_mainLabel];
        }
        _mainLabel.text = text;
    } else {
        [_mainLabel removeFromSuperview];
        _mainLabel = nil;
    }

    topText = upText;
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
    return _mainLabel ? _mainLabel.text : mainText;
}

/**
* 获得按键上标签内容
*/
- (NSString *)topText {
    return _topLabel ? _topLabel.text : topText;
}

@end
