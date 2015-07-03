//
//  CharKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "CharKBBtn.h"
#import "KeyboardConfig.h"
#import "Defines.h"

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
    [super layoutSubviews];

    NSString *themeName = [KeyboardConfig currentTheme];
    //当有主题设置
    if (themeName) {
    }else{
        [_topLabel sizeToFit];
        [_mainLabel sizeToFit];
        
        //subView的中心点位置根据boundSize来设置
        CGSize boundSize = self.contentView.bounds.size;
        CGSize topLbSize = _topLabel.bounds.size;
        CGSize mainLbSize = _mainLabel.bounds.size;

        CGFloat mainLbY = boundSize.height / 4 + (boundSize.height * 3 / 4 - mainLbSize.height) / 2;
        _topLabel.frame = CGRectMake((boundSize.width - topLbSize.width) / 2, (CGFloat) (mainLbY-SPACE_TOP_MAIN-topLbSize.height), topLbSize.width, topLbSize.height);
        _mainLabel.frame = CGRectMake((boundSize.width - mainLbSize.width) / 2, mainLbY, mainLbSize.width, mainLbSize.height);
        
    }
    [super layoutSubviews];
}


- (void)setTopText:(NSString *)upText text:(NSString *)text {
    
    NSString *themeName = [KeyboardConfig currentTheme];
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
        UIImage *kbLabImamge = [KeyboardConfig getKBLabImageWithByName:themeName withText:text];
        self.contentView.layer.contents = (__bridge id) kbLabImamge.CGImage;
        self.contentView.layer.contentsGravity = kCAGravityResizeAspect;    //等同于UIViewContentModeScaleAspectFit
        self.contentView.layer.contentsScale = [[UIScreen mainScreen] scale];
        
    } else {
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
        }else{
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
        }else{
            [_mainLabel removeFromSuperview];
            _mainLabel = nil;
        }
    }
    
    topText = upText;
    mainText = text;
    
}

-(void)setText:(NSString *)text{
    [self setTopText:nil text:text];
}

-(NSString *)text{
    return _mainLabel?_mainLabel.text:mainText;
}

-(NSString *)topText{
    return _topLabel?_topLabel.text: topText;
}

@end
