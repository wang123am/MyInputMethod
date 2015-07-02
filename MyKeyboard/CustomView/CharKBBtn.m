//
//  CharKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "CharKBBtn.h"
#import "KeyboardConfiguration.h"

@implementation CharKBBtn{
    NSString *topText;
    NSString *mainText;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubViews];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
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

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setupSubViews];
}

- (void)setupSubViews {
    [super setupSubViews];

//    [self setText:nil topText:nil];
}

- (void)layoutSubviews {

//    //当约束情况,sizeToFit不生效，采用
//    _topLabel.preferredMaxLayoutWidth = [_topLabel alignmentRectForFrame:_topLabel.frame].size.width;

    NSString *themeName = [KeyboardConfiguration currentTheme];
    //当有主题设置
    if (themeName) {
        [_topLabel sizeToFit];
        [_mainLabel sizeToFit];

        //subView的中心点位置根据boundSize来设置
        CGSize boundSize = self.contentView.bounds.size;
        CGSize topLbSize = _topLabel.bounds.size;
        CGSize mainLbSize = _mainLabel.bounds.size;
        _topLabel.frame = CGRectMake((boundSize.width - topLbSize.width) / 2, (boundSize.height / 4 - topLbSize.height) / 2, topLbSize.width, topLbSize.height);
        _mainLabel.frame = CGRectMake((boundSize.width - mainLbSize.width) / 2, boundSize.height / 4 + (boundSize.height * 3 / 4 - mainLbSize.height) / 2, mainLbSize.width, mainLbSize.height);

    }
    [super layoutSubviews];
}


- (void)setText:(NSString *)text topText:(NSString *)upText {

    NSString *themeName = [KeyboardConfiguration currentTheme];
    //当有主题设置
    if (themeName) {
        if(_topLabel){
            [_topLabel removeFromSuperview];
            _topLabel = nil;
        }
        if(_mainLabel){
            [_mainLabel removeFromSuperview];
            _mainLabel = nil;
        }

        //设置图片
        UIImage *kbLabImamge = [KeyboardConfiguration getKBLabImageWithByName:themeName withText:text];
        self.contentView.layer.contents = (__bridge id) kbLabImamge.CGImage;
        self.contentView.layer.contentsGravity = kCAGravityResizeAspect;    //等同于UIViewContentModeScaleAspectFit
        self.contentView.layer.contentsScale = [[UIScreen mainScreen] scale];

    } else {
        CGSize boundSize = self.contentView.bounds.size;
        if (upText) {
            if (!_topLabel) {
                _topLabel = [[UILabel alloc] initWithFrame:CGRectMake(boundSize.width / 2, 0, boundSize.width, boundSize.height / 4)];
                _topLabel.textAlignment = NSTextAlignmentCenter;
                [self.contentView addSubview:_topLabel];
            }
            _topLabel.text = upText;
        }else{
            [_topLabel removeFromSuperview];
            _topLabel = nil;
        }

        if (text) {
            if (!_mainLabel) {
                _mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(boundSize.width / 2, boundSize.height / 4, boundSize.width, boundSize.height * 3 / 4)];
                _mainLabel.textAlignment = NSTextAlignmentCenter;
                _mainLabel.backgroundColor = [UIColor blueColor];
                [self.contentView addSubview:_mainLabel];
            }
            _mainLabel.text = text;
        }else{
            [_mainLabel removeFromSuperview];
            _mainLabel = nil;
        }
    }

    topText = upText;
    mainText = text;

}

-(void)setText:(NSString *)text{
    [self setText:text topText:nil];
}

-(NSString *)text{
    return _mainLabel?_mainLabel.text:mainText;
}

-(NSString *)topText{
    return _topLabel?_topLabel.text: topText;
}

@end
