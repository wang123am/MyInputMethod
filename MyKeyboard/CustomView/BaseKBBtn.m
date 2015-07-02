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

@implementation BaseKBBtn {
    CALayer *shadowlayer;
}

- (instancetype)init {
    Log(@"--------%d:%s：", __LINE__, __func__);
    self = [super init];
    if (self) {
        [self setupSubViews];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    Log(@"--------%d:%s：", __LINE__, __func__);
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }

    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    Log(@"--------%d:%s：", __LINE__, __func__);
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }

    return self;
}

- (void)awakeFromNib {
    Log(@"--------%d:%s：", __LINE__, __func__);
    [super awakeFromNib];

    [self setupSubViews];
}


- (void)setupSubViews {
    self.backgroundColor = [UIColor clearColor];

    if(_contentView){
        [_contentView removeFromSuperview];
        _contentView = nil;
    }
    
    _contentView = [[UIView alloc] initWithFrame:CGRectInset(self.bounds, 3, 5)];
    _contentView.userInteractionEnabled = NO;
    [self addSubview:_contentView];

    //当前主题
    NSString *themeName = [KeyboardConfiguration currentTheme];

    //当有主题设置
    if (themeName) {
        UIImage *kbBtnImamge = [KeyboardConfiguration getBtnImageWithByName:themeName];
        _contentView.layer.contents = (__bridge id) kbBtnImamge.CGImage;
        _contentView.layer.contentsScale = [[UIScreen mainScreen] scale];

    } else {
        //当没有设置主题
        _contentView.layer.backgroundColor = COLOR_KBBTN_CONTENTVIEW;
        _contentView.layer.cornerRadius = R_KBBTN_CONTENTVIEW;
        // 给按钮添加阴影层
        [self setupShadowLayer];
    }
}

- (void)setupShadowLayer {

    if(shadowlayer){
        [shadowlayer removeFromSuperlayer];
        shadowlayer = nil;
    }
    // 给按钮添加阴影层
    shadowlayer = [CALayer layer];
    shadowlayer.contentsScale = self.layer.contentsScale;
    shadowlayer.contentsScale = self.layer.contentsScale;
    shadowlayer.backgroundColor = COLOR_SHADOWLAYER;
    shadowlayer.cornerRadius = R_SHADOWLAYER;

    shadowlayer.frame = CGRectMake(_contentView.frame.origin.x, (CGFloat) (_contentView.frame.origin.y + _contentView.frame.size.height - HEIGHT_SHADOWLAYER + OFFSET_SHADOWLAYER), _contentView.frame.size.width, HEIGHT_SHADOWLAYER);
    [self.layer insertSublayer:shadowlayer below:_contentView.layer];

}

- (void)layoutSubviews {
    [super layoutSubviews];

    shadowlayer.frame = CGRectOffset(self.layer.frame, 0, OFFSET_SHADOWLAYER);
    _contentView.frame = CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL);
    shadowlayer.frame = CGRectMake(_contentView.frame.origin.x, (CGFloat) (_contentView.frame.origin.y + _contentView.frame.size.height - HEIGHT_SHADOWLAYER + OFFSET_SHADOWLAYER), _contentView.frame.size.width, HEIGHT_SHADOWLAYER);

}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    
    _contentView.layer.contents = (__bridge id) image.CGImage;
    _contentView.layer.contentsScale = [[UIScreen mainScreen] scale];
}

@end
