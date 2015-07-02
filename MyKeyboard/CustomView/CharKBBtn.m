 //
//  CharKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "CharKBBtn.h"
#import "KBLabel.h"

@implementation CharKBBtn

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

    return self;
}

- (void)setupSubViews {
    [super setupSubViews];

    //注意:layerSize比boundSize小一圈

    //subView的大小根据layerSize来设置
    CGSize frameSize = self.frame.size;
    CGSize layerSize = self.layer.bounds.size;
    _topLabel = [[KBLabel alloc] initWithFrame:CGRectMake(0, 0, layerSize.width, layerSize.height / 4)];
    _mainLabel = [[KBLabel alloc] initWithFrame:CGRectMake(0, 0, layerSize.width, layerSize.height * 3 / 4)];

    //subView的中心点位置根据boundSize来设置
    CGSize boundSize = self.bounds.size;
    _topLabel.center = CGPointMake((CGFloat) boundSize.width / 2, (CGFloat) boundSize.height / 2 - layerSize.height * 3 / 8);
    _mainLabel.center = CGPointMake((CGFloat) boundSize.width / 2, (CGFloat) boundSize.height / 2 + layerSize.height / 8);

    [self addSubview:_topLabel];
    [self addSubview:_mainLabel];
}

- (void)layoutSubviews {

//    //当约束情况,sizeToFit不生效，采用
//    _topLabel.preferredMaxLayoutWidth = [_topLabel alignmentRectForFrame:_topLabel.frame].size.width;
    
    [_topLabel sizeToFit];
    [_mainLabel sizeToFit];
    
    //subView的中心点位置根据boundSize来设置
    CGSize boundSize = self.bounds.size;
    _topLabel.center = CGPointMake((CGFloat) boundSize.width / 2, (CGFloat) boundSize.height / 2 - boundSize.height * 3 / 8);
    _mainLabel.center = CGPointMake((CGFloat) boundSize.width / 2, (CGFloat) boundSize.height / 2 + boundSize.height / 8);
    
    [super layoutSubviews];
}


@end
