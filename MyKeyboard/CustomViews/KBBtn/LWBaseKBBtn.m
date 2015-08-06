//
//  LWBaseKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWBaseKBBtn.h"
#import "LWDefines.h"


@implementation LWBaseKBBtn {
    CALayer *_shadowlayer;      //阴影
    CALayer *_innerGlow;        //内边框
}

- (id)initWithCoder:(NSCoder *)coder {
//    Log(@"--------%d:%s：", __LINE__, __func__);
    self = [super initWithCoder:coder];
    if (self) {

        //构建子视图
        [self setupSubViews];
    }

    return self;
}


/**
* layout 子视图
*/
- (void)layoutSubviews {
    _contentView.frame = CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL);

    //重设阴影大小
    _shadowlayer.frame = CGRectOffset(_contentView.frame, 0, OFFSET_SHADOWLAYER);
    _shadowlayer.frame = CGRectMake(_contentView.frame.origin.x, (CGFloat) (_contentView.frame.origin.y + _contentView.frame.size.height - HEIGHT_SHADOWLAYER + OFFSET_SHADOWLAYER),
            _contentView.frame.size.width, HEIGHT_SHADOWLAYER);

    //重设置内边框、背景、高亮背景大小
    _innerGlow.frame = CGRectInset(self.bounds, 1, 1);

    _backgroundLayer.frame = CGRectInset(_contentView.frame, 0, 0);
    _highlightBackgroundLayer.frame = CGRectInset(_contentView.frame, 0, 0);

    [super layoutSubviews];

}

/**
* 重载setHightlighted方法
*/
- (void)setHighlighted:(BOOL)highlighted {
    // Disable隐式动画
    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    //隐藏/显示反转的背景图层
    _highlightBackgroundLayer.hidden = !highlighted;
    [CATransaction commit];

    [super setHighlighted:highlighted];
}

/**
* 重载setImage: forState方法
*/
- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    if (state & UIControlStateHighlighted || state & UIControlStateSelected) {
        [self setupHighlightBackgroundLayer:image withGravity:kCAGravityCenter];
    } else {
        [self setupBackgroundLayer:image withGravity:kCAGravityCenter];
    }
}

/**
* 设置子视图
*/
- (void)setupSubViews {
    self.backgroundColor = [UIColor clearColor];

    if (_contentView) {
        [_contentView removeFromSuperview];
        _contentView = nil;
    }

    _contentView = [[UIView alloc] initWithFrame:CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL)];
    _contentView.userInteractionEnabled = NO;
    [self addSubview:_contentView];

    //设置背景图层
    [self setupBackgroundLayer:nil withGravity:kCAGravityCenter];
    [self setupHighlightBackgroundLayer:nil withGravity:kCAGravityCenter];
    _highlightBackgroundLayer.hidden = YES;

    //给contentView添加内外边框
//    [self setupInnerGlow];
    [self setupBorder];

    //给contentView添加阴影
    [self setupShadowLayer];
}

/**
* 按Normal状态时的背景色
*/
- (void)setupBackgroundLayer:(UIImage *)image withGravity:(NSString *)gravity {
    //创建背景图层
    if (!_backgroundLayer) {
        _backgroundLayer = [CALayer layer];
        _backgroundLayer.cornerRadius = RADIUS_KBBTN_CONTENTVIEW;
        _backgroundLayer.masksToBounds = YES;
        _backgroundLayer.frame = CGRectInset(_contentView.frame, 0, 0);
        [self.layer insertSublayer:_backgroundLayer atIndex:0];
    }

    //背景用图片设置
    if (image) {
        _backgroundLayer.backgroundColor = [UIColor clearColor].CGColor;
        _backgroundLayer.opacity = 1.0;
        _backgroundLayer.contents = (__bridge id) image.CGImage;
        _backgroundLayer.contentsScale = [[UIScreen mainScreen] scale];
        _backgroundLayer.contentsGravity = gravity;//kCAGravityResizeAspect;

        //否则用颜色值
    } else {
        _backgroundLayer.backgroundColor = [UIColor clearColor].CGColor;
        _backgroundLayer.opacity = 1.0;
    }
}

/**
* 按Highlight状态时的背景色
*/
- (void)setupHighlightBackgroundLayer:(UIImage *)image withGravity:(NSString *)gravity {
    //创建高亮背景图层
    if (!_highlightBackgroundLayer) {
        _highlightBackgroundLayer = [CALayer layer];
        _highlightBackgroundLayer.cornerRadius = RADIUS_KBBTN_CONTENTVIEW;
        _highlightBackgroundLayer.frame = CGRectInset(_contentView.frame, 0, 0);
        [self.layer insertSublayer:_highlightBackgroundLayer atIndex:1];
    }

    //背景用图片设置
    if (image) {
        _highlightBackgroundLayer.backgroundColor = [UIColor clearColor].CGColor;
        _highlightBackgroundLayer.opacity = 1.0;
        _highlightBackgroundLayer.contents = (__bridge id) image.CGImage;
        _highlightBackgroundLayer.contentsScale = [[UIScreen mainScreen] scale];
        _highlightBackgroundLayer.contentsGravity = gravity;//kCAGravityResizeAspect;
    } else {
        //否则用颜色值
        _highlightBackgroundLayer.backgroundColor = COLOR_KBBTN_CONTENTVIEW_BG;
        _highlightBackgroundLayer.opacity = OPACITY_KBBTN_CONTENTVIEW_BG_HIGHLIGHT;
    }
}

/**
* 给contentView添加内边框
*/
- (void)setupInnerGlow {
    if (!_innerGlow) {
        _innerGlow = [CALayer layer];
        _innerGlow.cornerRadius = RADIUS_KBBTN_CONTENTVIEW_INNERBORDER;
        _innerGlow.borderWidth = WIDTH_KBBTN_CONTENTVIEW_INNERBORDER;
        _innerGlow.borderColor = COLOR_KBBTN_CONTENTVIEW_INNERBORDER;
        _innerGlow.opacity = 0.5;

        [_contentView.layer insertSublayer:_innerGlow atIndex:2];
    }
}

/**
* 给contentView添加外边框
*/
- (void)setupBorder {
    CALayer *layer = _contentView.layer;
    layer.cornerRadius = RADIUS_KBBTN_CONTENTVIEW;
    layer.borderWidth = WIDTH_KBBTN_CONTENTVIEW_BORDER;
    layer.borderColor = COLOR_KBBTN_CONTENTVIEW_BORDER;
}

/**
* 给contentView添加阴影
*/
- (void)setupShadowLayer {

    if (_shadowlayer) {
        [_shadowlayer removeFromSuperlayer];
        _shadowlayer = nil;
    }
    // 给按钮添加阴影层
    _shadowlayer = [CALayer layer];
    _shadowlayer.contentsScale = self.layer.contentsScale;
    _shadowlayer.contentsScale = self.layer.contentsScale;
    _shadowlayer.backgroundColor = COLOR_SHADOWLAYER;
    _shadowlayer.cornerRadius = RADIUS_SHADOWLAYER;

    _shadowlayer.frame = CGRectMake(_contentView.frame.origin.x, (CGFloat) (_contentView.frame.origin.y + _contentView.frame.size.height - HEIGHT_SHADOWLAYER + OFFSET_SHADOWLAYER),
            _contentView.frame.size.width, HEIGHT_SHADOWLAYER);
    [self.layer insertSublayer:_shadowlayer below:_contentView.layer];
}


@end
