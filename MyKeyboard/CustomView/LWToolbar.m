//
//  LWToolbar.m
//  MyInputMethod
//
//  Created by luowei on 15/7/6.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWToolbar.h"
#import "Defines.h"

@implementation LWToolbar

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupToolbar];
    }

    return self;
}


- (void)setupToolbar {
    self.backgroundColor = COLOR_TOOLBAR_BG;
    self.layer.borderWidth = WIDTH_TOOLBAR_BORDER;
    self.layer.borderColor = COLOR_TOOLBAR_BORDER;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
