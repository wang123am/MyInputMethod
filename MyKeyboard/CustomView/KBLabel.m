//
// Created by luowei on 15/7/1.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "KBLabel.h"
#import "KeyboardConfiguration.h"


@implementation KBLabel {
    NSString *kbText;
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

//    // required to prevent Auto Layout from compressing the label (by 1 point usually) for certain constraint solutions
//    [self setContentCompressionResistancePriority:UILayoutPriorityRequired
//                                          forAxis:UILayoutConstraintAxisVertical];

    return self;
}

- (void)setupSubViews {
//当前主题
    NSString *themeName = [KeyboardConfiguration currentTheme];
    //当有主题设置
    if(themeName){
            UIImage *kbLabImamge = [KeyboardConfiguration getKBLabImageWithByName:themeName withText:nil];
            self.layer.contents = (__bridge id)kbLabImamge.CGImage;
            self.layer.contentsGravity = kCAGravityResizeAspect;    //等同于UIViewContentModeScaleAspectFit
            self.layer.contentsScale = [[UIScreen mainScreen] scale];

        }
}

- (void)layoutSubviews {
    [super layoutSubviews];

//    //当约束情况,sizeToFit不生效，采用
//    self.preferredMaxLayoutWidth = CGRectGetWidth(self.bounds);
//    [super layoutSubviews];

//    if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])) {
//        [self invalidateIntrinsicContentSize];
//    }

}

//- (CGSize)intrinsicContentSize {
//    return self.frame.size;
//}

//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
//    return [super systemLayoutSizeFittingSize:targetSize];
//}


- (void)setText:(NSString *)text {
    NSString *themeName = [KeyboardConfiguration currentTheme];
    //当有主题设置
    if(themeName){
        kbText = text;
        //设置图片
        UIImage *kbLabImamge = [KeyboardConfiguration getKBLabImageWithByName:themeName withText:text];
        self.layer.contents = (__bridge id)kbLabImamge.CGImage;
        self.layer.contentsGravity = kCAGravityResizeAspect;    //等同于UIViewContentModeScaleAspectFit
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
    }else{
        [super setText:text];
    }

}

- (NSString *)text {
    NSString *themeName = [KeyboardConfiguration currentTheme];
    if(themeName){
        //设置图片
        return kbText;
    }else{
        return [super text];
    }
}


@end