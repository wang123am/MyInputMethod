//
//  KeyKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "KeyKBBtn.h"
#import "KBLabel.h"

@implementation KeyKBBtn

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //注意:layerSize比boundSize小一圈
    
        //subView的大小根据layerSize来设置
        CGSize layerSize = self.layer.bounds.size;
        _mainLabel = [[KBLabel alloc] initWithFrame:CGRectMake(0, 0, layerSize.width, layerSize.height /2)];
    
        //subView的中心点位置根据boundSize来设置
        CGSize boundSize = self.bounds.size;
        _mainLabel.center = CGPointMake((CGFloat) boundSize.width / 2, (CGFloat) boundSize.height / 2);

        [self addSubview:_mainLabel];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [_mainLabel sizeToFit];

    //subView的中心点位置根据boundSize来设置
    CGSize boundSize = self.bounds.size;
    _mainLabel.center = CGPointMake((CGFloat) boundSize.width / 2, (CGFloat) boundSize.height / 2 - boundSize.height * 3 / 8);
}

@end
