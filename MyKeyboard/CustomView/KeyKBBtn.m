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
#import "MyHelper.h"

@implementation KeyKBBtn{
    NSString *mainText;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews {
    [super setupSubViews];
    
    //    [self setText:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //当有主题设置
    if ([KeyboardConfig currentTheme]) {
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
    //当有主题设置
    if ([KeyboardConfig currentTheme]) {
        [_mainLabel removeFromSuperview];
        _mainLabel = nil;

        //设置图片
        NSString *smallName = [KeyboardConfig fullKBTagImageDic][@(self.tag)];
        NSDictionary *rootDic = [KeyboardConfig currentTheme];

        UIImage *bigImage = [UIImage imageNamed:rootDic[@"meta"][@"image"]];
        CGFloat bigWidth = ((NSNumber *)rootDic[@"meta"][@"width"]).floatValue;
        CGFloat bigHeight = ((NSNumber *)rootDic[@"meta"][@"height"]).floatValue;

        NSDictionary *rectDict = rootDic[@"frames"][smallName];
        CGFloat x = ((NSNumber *)rectDict[@"x"]).floatValue/bigWidth;
        CGFloat y = ((NSNumber *)rectDict[@"y"]).floatValue/bigHeight;
        CGFloat width = ((NSNumber *)rectDict[@"w"]).floatValue/bigWidth;
        CGFloat height = ((NSNumber *)rectDict[@"h"]).floatValue/bigHeight;

        [self setupBackgroundLayer:bigImage withGravity:kCAGravityResizeAspect];
        self.backgroundLayer.contentsRect = CGRectMake(x, y, width, height);

//        [self setupBackgroundLayer:kbLabImamge withGravity:kCAGravityResizeAspectFill];
//        //修改图片透明度
//        UIImage *kbNewLabBtnImage = [kbLabImamge imageByApplyingAlpha:OPACITY_KBBTN_CONTENTVIEW_BG_HIGHLIGHT];
//        [self setupHighlightBackgroundLayer:kbNewLabBtnImage withGravity:kCAGravityResizeAspectFill];

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
