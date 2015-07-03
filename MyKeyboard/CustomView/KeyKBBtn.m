//
//  KeyKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "KeyKBBtn.h"
#import "KeyboardConfig.h"
#import "Defines.h"

@implementation KeyKBBtn{
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
    
    //    [self setText:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSString *themeName = [KeyboardConfig currentTheme];
    //当有主题设置
    if (themeName) {
    }else{
        [_mainLabel sizeToFit];
        
        //subView的中心点位置根据boundSize来设置
        CGSize boundSize = self.contentView.bounds.size;
        CGSize mainLbSize = _mainLabel.bounds.size;
        _mainLabel.frame = CGRectMake((boundSize.width - mainLbSize.width) / 2, boundSize.height / 8 + (boundSize.height * 3 / 4 - mainLbSize.height) / 2, mainLbSize.width, mainLbSize.height);
        
    }

    [super layoutSubviews];
}

-(void)setText:(NSString *)text{
    NSString *themeName = [KeyboardConfig currentTheme];
    //当有主题设置
    if (themeName) {
        [_mainLabel removeFromSuperview];
        _mainLabel = nil;
        
        //设置图片
        UIImage *kbLabImamge = [KeyboardConfig getKBLabImageWithByName:themeName withText:text];
        self.contentView.layer.contents = (__bridge id) kbLabImamge.CGImage;
        self.contentView.layer.contentsGravity = kCAGravityResizeAspect;    //等同于UIViewContentModeScaleAspectFit
        self.contentView.layer.contentsScale = [[UIScreen mainScreen] scale];
        
    } else {
        if(text){
            if(!_mainLabel){
                CGSize boundSize = self.contentView.bounds.size;
                _mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, boundSize.height/8, boundSize.width, boundSize.height*3 /4)];
                _mainLabel.textAlignment = NSTextAlignmentCenter;
                _mainLabel.font = MAINTEXT_FONT;
                [self.contentView addSubview:_mainLabel];
            }
            _mainLabel.text = text;
        } else{
            [_mainLabel removeFromSuperview];
            _mainLabel = nil;
        }
    }
    mainText = text;
}

-(NSString *)text{
    return _mainLabel?_mainLabel.text:mainText;
}

@end
