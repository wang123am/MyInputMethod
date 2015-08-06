//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWPinYinLeftTabView.h"
#import "LWDefines.h"

#define PinYinNine_Symbols @[@"，",@"。",@"？",@"！",@"...",@"～",@"、",@"：",@"="]
#define DOUBLEBYTE_SYMBOLS @[@"，",@"。",@"？",@"！",@"、",@"："]

@implementation LWPinYinLeftTabView {

}

- (instancetype)initWithCoder:(NSCoder *)coder {
//    Log(@"--------%d:%s：", __LINE__, __func__);
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        self.dataList = PinYinNine_Symbols;

        //构建子视图
        [self setupSubViews];
    }

    return self;
}

/**
* layout 子视图
*/
- (void)layoutSubviews {
    [super layoutSubviews];

    self.contentView.frame = CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL);
    [self.contentView reloadData];
//    //重设置内边框、背景、高亮背景大小
//    _innerGlow.frame = CGRectInset(self.bounds, 1, 1);
    [super layoutSubviews];

}

/**
* 设置子视图,考虑到九格键盘设置网格风格时个特殊性
*/
- (void)setupSubViews {

    if (self.contentView) {
        [self.contentView removeFromSuperview];
        self.contentView = nil;
    }

    self.contentView = [[UITableView alloc] initWithFrame:CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL) style:UITableViewStylePlain];
    self.contentView.dataSource = self;
    self.contentView.delegate = self;
    self.contentView.showsVerticalScrollIndicator = NO;
    self.contentView.tableFooterView = [[UIView alloc] init];
    self.contentView.separatorInset = Cell_SeparatorInset;
    self.contentView.layoutMargins = UIEdgeInsetsZero;
    [self addSubview:self.contentView];

    //设置contentView背景透明
    self.contentView.backgroundColor = [UIColor clearColor];
//    self.contentView.backgroundView.backgroundColor = [UIColor clearColor];

    //给contentView添加内外边框
//    [self setupInnerGlow];
    [self setupBorder];

    //给contentView添加阴影
    [self setupShadowLayer];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    UILabel *textLabel = (UILabel *) [cell.contentView viewWithTag:10];
    if (!textLabel) {
        textLabel = [[UILabel alloc] init];
        textLabel.tag = 10;
        [cell.contentView addSubview:textLabel];
    }

    textLabel.font = [UIFont systemFontOfSize:16.0];
    textLabel.textColor = [UIColor blackColor];

    NSString *text = self.dataList[(NSUInteger) indexPath.row];
    if ([DOUBLEBYTE_SYMBOLS containsObject:text]) {
        //设置中文全角字符居中显示
        NSAttributedString *as =  [[NSAttributedString alloc] initWithString:text
                                                                  attributes:@{NSKernAttributeName : @(-6.5)}];
        textLabel.attributedText = as;
    }else{
        textLabel.text = text;
    }

    [textLabel sizeToFit];
    textLabel.center = cell.contentView.center;

    return cell;
}

@end

