//
//  MyKeyboardViewController.m
//  MyKeyboard
//
//  Created by luowei on 15/6/30.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "MyKeyboardViewController.h"
#import "LWDefines.h"
#import "LWBaseKeyboard.h"
#import "LWPinYinFullKeyboard.h"
#import "LWPinYinNineKeyboard.h"
#import "LWToolBar.h"
#import "LWSingleHandView.h"
#import "LWKeyboardConfig.h"
#import "LWKeyboardLogic.h"
#import "LWEnFullKeyboard.h"
#import "LWRootWrapView.h"
#import "LWBaseKBBtn.h"
#import "LWNumKeyboard.h"
#import "LWWuBiFullKeyboard.h"
#import "LWBiHuaKeyboard.h"
#import "LWKeyboardWrap.h"
#import "LWTopView.h"
#import "LWLeftTabView.h"
#import "LWRootWrapView.h"


@interface MyKeyboardViewController ()<LWBaseKeyboardDelegate, LWToolbarDelegate, LWLeftTabViewDelegate>

//单手之外区域
@property(nonatomic, strong) LWRootWrapView *rootWrapView;

//包裹keyboard的视图
@property(nonatomic, strong) LWKeyboardWrap *keyboardWrap;
//包裹toolbar 或 predictive 的视图
@property(nonatomic, strong) LWTopView *topView;
//单手模式视图
@property(nonatomic, strong) LWSingleHandView *singleHandView;

//工具条
@property(nonatomic, strong) LWToolBar *toolbar;

//键盘
@property(nonatomic, strong) LWBaseKeyboard *keyboard;

//inputView的约束
@property(nonatomic, strong) NSMutableArray *inputViewConstraints;

@end

@implementation MyKeyboardViewController


- (void)awakeFromNib {
    [super awakeFromNib];
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
}


- (void)loadView {
    [super loadView];
    Log(@"--------%d:%s \n\n", __LINE__, __func__);

    if (self.inputView) {
        self.inputView.frame = CGRectMake(0, 0, Screen_W, Input_H);
        //设置皮肤
        UIImage *keyboardSkin = [LWKeyboardConfig keyboardSkin];
        if (keyboardSkin) {
//            [_keyboard setupBackground:keyboardSkin];
            [self setupSkin:keyboardSkin];
        }
    }

}

/**
* 设置皮肤
*/
- (void)setupSkin:(UIImage *)image {
    self.inputView.layer.contents = (__bridge id) image.CGImage;
    self.inputView.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.inputView.layer.contentsGravity = kCAGravityResizeAspectFill;
}


- (void)viewDidLoad {
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
    [super viewDidLoad];

    _inputViewConstraints = @[].mutableCopy;


}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    Log(@"--------%d:%s \n\n", __LINE__, __func__);

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
}

- (void)viewDidLayoutSubviews {
    //设置包裹视图的大小与位置
    [self setupRootViewFrame];

    [super viewDidLayoutSubviews];
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
}


- (void)viewWillAppear:(BOOL)animated {
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
    [super viewWillAppear:animated];

    [self setupInputViewConstraints];

    //创建InputView底下的包裹视图
    [self createRootViews];

    //加载工具栏
    _toolbar = (LWToolBar *) [[NSBundle mainBundle] loadNibNamed:@"LWToolBar" owner:self.view options:nil][0];
    [_topView addSubview:_toolbar];
    _toolbar.delegate = self;

    //获得用户设置键盘
    KeyboardType keyboardType = [LWKeyboardConfig currentKeyboardType];

    //根据输入框类型加载相应键盘
    KeyboardType inputKeyboardType = [LWKeyboardLogic keyboardTypeWith:self.textDocumentProxy.keyboardType];
    switch (inputKeyboardType) {
        case Keyboard_ENFull: {
            _keyboard = (LWEnFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWEnFullKeyboard" owner:self.view options:nil][0];
            [LWKeyboardConfig setCurrentKeyboardType:Keyboard_ENFull];
            break;
        };
        case Keyboard_NumNine: {
            _keyboard = (LWEnFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWNumKeyboard" owner:self.view options:nil][0];
            LWLeftTabView *leftTab = (LWLeftTabView *) [_keyboard viewWithTag:100];
            leftTab.delegate = self;
            [LWKeyboardConfig setCurrentKeyboardType:Keyboard_NumNine];
            break;
        };

        default : {

            if (keyboardType == Keyboard_PingYingNine) {
                _keyboard = (LWPinYinFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWPinYinFullKeyboard" owner:self.view options:nil][0];
                [LWKeyboardConfig setCurrentKeyboardType:Keyboard_PingYingNine];
                LWLeftTabView *leftTab = (LWLeftTabView *) [_keyboard viewWithTag:100];
                leftTab.delegate = self;
            }else if(keyboardType == keyboard_WuBiFull){
                _keyboard = (LWWuBiFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWWuBiFullKeyboard" owner:self.view options:nil][0];
                [LWKeyboardConfig setCurrentKeyboardType:keyboard_WuBiFull];
            }else if(keyboardType == keyboard_BiHuaNine){
                _keyboard = (LWBiHuaKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWBiHuaKeyboard" owner:self.view options:nil][0];
                LWLeftTabView *leftTab = (LWLeftTabView *) [_keyboard viewWithTag:100];
                leftTab.delegate = self;
                [LWKeyboardConfig setCurrentKeyboardType:keyboard_BiHuaNine];
            }else {
                _keyboard = (LWPinYinFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWPinYinFullKeyboard" owner:self.view options:nil][0];
                [LWKeyboardConfig setCurrentKeyboardType:Keyboard_PingYingFull];
            }
            break;
        };

    }

    [_keyboardWrap addSubview:_keyboard];
    _keyboard.delegate = self;

}

- (void)viewDidAppear:(BOOL)animated {
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
    [super viewDidAppear:animated];


}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    Log(@"--------%d:%s \n\n", __LINE__, __func__);
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self setupInputViewConstraints];
}


/**
* 给inputView设置约束
*/
- (void)setupInputViewConstraints {
//设置InputView约束
    NSLayoutConstraint *inputViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.inputView
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1
                                                                                  constant:Input_H];
    inputViewHeightConstraint.priority = UILayoutPriorityDefaultHigh;
    [_inputViewConstraints addObject:inputViewHeightConstraint];
    [NSLayoutConstraint activateConstraints:_inputViewConstraints];
}

/**
* 创建InputView底下的包裹视图
*/
- (void)createRootViews {

    //单手视图以外区域视图
    _rootWrapView = [[LWRootWrapView alloc] initWithFrame:CGRectMake(0, 0, Screen_W, Input_H)];
    [self.inputView addSubview:_rootWrapView];
    CGSize rootWrapSize = _rootWrapView.frame.size;

    //键盘包裹视图
    _keyboardWrap = [[LWKeyboardWrap alloc] initWithFrame:CGRectMake(0, (CGFloat) TopView_H, rootWrapSize.width, rootWrapSize.height -TopView_H)];
    [_rootWrapView addSubview:_keyboardWrap];
    _keyboardWrap.backgroundColor = [UIColor clearColor];
//    _keyboardWrap.alpha = 0.5;

    //单手模式视图
    if ([LWKeyboardConfig singleHandMode] > 0) {
        _singleHandView = [[LWSingleHandView alloc] initWithFrame:CGRectMake(0, SINGLEHAND_KEYBOARD_W, (CGFloat) (Screen_W - SINGLEHAND_KEYBOARD_W), Input_H)];
        [self.inputView addSubview:_singleHandView];
        _singleHandView.backgroundColor = [UIColor orangeColor];
    }

    //topView
    _topView = [[LWTopView alloc] initWithFrame:CGRectMake(0, 0, SINGLEHAND_KEYBOARD_W, (CGFloat) TopView_H)];
    [_rootWrapView addSubview:_topView];
    _topView.backgroundColor = [UIColor clearColor];

}

/**
* 设置包裹视图大小位置
*/
- (void)setupRootViewFrame {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //不在主线程执行


    CGFloat rootWrapX = 0.0;
    CGFloat rootWrapW = Screen_W;
    CGFloat rootWrapH = Input_H;

    //keyboardWrap与topView的左间隙及右间隙
    CGFloat topViewWrapX = 0.0;
    CGFloat topViewWrapW = rootWrapW;
    CGFloat topViewWrapH =  TopView_H;

    CGFloat keyboardWraX = 0.0;
    CGFloat keyboardWraY = TopView_H;
    CGFloat keyboardWraW = rootWrapW;
    CGFloat keyboardWraH = Input_H - TopView_H;


    //如果用户设置了单手模式
    if ([LWKeyboardConfig singleHandMode] > 0) {
        //设置宽高、位置
        rootWrapW = SINGLEHAND_KEYBOARD_W;
        topViewWrapW = SINGLEHAND_KEYBOARD_W;
        keyboardWraW = SINGLEHAND_KEYBOARD_W;

        CGFloat singleHandViewX = SINGLEHAND_KEYBOARD_W;
        CGFloat singleHandViewW = (CGFloat) (Screen_W - SINGLEHAND_KEYBOARD_W);
        CGFloat singleHandViewH = Input_H;

        if ([LWKeyboardConfig singleHandMode] == SingleHand_RightMode) {
            rootWrapX = (CGFloat) (Screen_W - SINGLEHAND_KEYBOARD_W);
            topViewWrapX = (CGFloat) (Screen_W - SINGLEHAND_KEYBOARD_W);
            keyboardWraX = (CGFloat) (Screen_W - SINGLEHAND_KEYBOARD_W);
            singleHandViewX = 0.0;
        }

        //设置singleHandView大小位置
        _singleHandView.frame = CGRectMake(singleHandViewX, 0.0, singleHandViewW, singleHandViewH);
    }

    //rootWrapView大小位置
    _rootWrapView.frame = CGRectMake(rootWrapX, 0.0, rootWrapW, rootWrapH);
    //设置topView大小位置
    _topView.frame = CGRectMake(topViewWrapX, 0.0, topViewWrapW, topViewWrapH);
    //设置keyboardWrapView大小位置
    _keyboardWrap.frame = CGRectMake(keyboardWraX, keyboardWraY, keyboardWraW, keyboardWraH);

    //主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        //在主线程执行
    });

//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}


#pragma mark UITextInputDelegate Implamentation

- (void)textWillChange:(id <UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id <UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.

}


#pragma mark textDocumentProxy 实现相关

/**
* 上屏插入字符
*/
- (void)insertText:(NSString *)text {
    if (text) {
        [self.textDocumentProxy insertText:text];

        //TODO:更新换行符状态
    }
}


/**
* 切换输入法
*/
- (void)switchInputMethod {
    [self advanceToNextInputMode];
}

/**
* 根据类型添加浮窗
*/
- (void)addPopViewWithBtn:(UIView *)btn type:(PopViewType)type {
    switch (type){
        case PopView_LogoBtn:{
            [_rootWrapView addLogoPop:btn];
            break;
        };
        case PopView_OftenWordsBtn:{
            [_rootWrapView addOftenWordsPop:btn];
            break;
        };
        case PopView_EmojiBtn:{
            [_rootWrapView addEmojiPop:btn];
            break;
        };
        case PopView_NextBtn:{
            [_rootWrapView addNextPop:btn];
            break;
        };
        case PopView_FullCharBtn:{
            [_rootWrapView addFullCharBtnPop:btn];
            break;
        };
        default:
            break;
    }
}

/**
* 删除浮窗
*/
- (void)removePopViewWithype:(PopViewType)type {
    switch (type){
        case PopView_LogoBtn:{
            [_rootWrapView removeLogoPop];
            break;
        };
        case PopView_OftenWordsBtn:{
            [_rootWrapView removeOftenWordsPop];
            break;
        };
        case PopView_EmojiBtn:{
            [_rootWrapView removeEmojiPop];
            break;
        };
        case PopView_NextBtn:{
            [_rootWrapView removeNextPop];
            break;
        };
        case PopView_FullCharBtn:{
            [_rootWrapView removeFullCharBtnPop];
            break;
        };
        default:
            break;
    }
}

/**
* 隐藏键盘
*/
- (void)dismiss {
    [self dismissKeyboard];
}

/**
* 切换键盘
*/
- (void)swithcKeyboard:(KeyboardType)type {

    [_keyboard removeFromSuperview];

    switch (type) {
        case Keyboard_ENFull: {
            _keyboard = (LWEnFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWEnFullKeyboard" owner:self.view options:nil][0];
            break;
        };
        case Keyboard_NumNine: {
            _keyboard = (LWNumKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWNumKeyboard" owner:self.view options:nil][0];
            LWLeftTabView *leftTab = (LWLeftTabView *) [_keyboard viewWithTag:100];
            leftTab.delegate = self;
            break;
        };
        case Keyboard_PingYingFull: {
            _keyboard = (LWPinYinFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWPinYinFullKeyboard" owner:self.view options:nil][0];
            break;
        };
        case Keyboard_PingYingNine: {
            _keyboard = (LWPinYinNineKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWPinYinNineKeyboard" owner:self.view options:nil][0];
            LWLeftTabView *leftTab = (LWLeftTabView *) [_keyboard viewWithTag:100];
            leftTab.delegate = self;
            break;
        };

        default : {
            break;
        };
    }

    [LWKeyboardConfig setCurrentKeyboardType:type];
    [_keyboardWrap addSubview:_keyboard];
    _keyboard.delegate = self;
}

#pragma mark 按键事件处理

/**
* 按键按下
*/
- (void)kbBtnTouchDown:(LWBaseKBBtn *)btn {

}

/**
* 按键重复按
*/
- (void)kbBtnTouchRepeat:(LWBaseKBBtn *)btn {

}

/**
* 按键按下
*/
- (void)kbBtnTouchUpInside:(LWBaseKBBtn *)btn {

}

/**
* 按键Touch取消
*/
- (void)kbBtnTouchCancel:(LWBaseKBBtn *)btn {

}

/**
* 按键轻扫
*/
- (void)kbBtnSwipe:(UISwipeGestureRecognizer *)recognizer {

}

/**
* 按键滑动
*/
- (void)kbBtnPan:(UIPanGestureRecognizer *)recognizer {

}

/**
* 按键长按
*/
- (void)kbBtnLongPress:(UILongPressGestureRecognizer *)recognizer {

}

@end
