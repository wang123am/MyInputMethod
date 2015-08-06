//
//  LWOftenWordsPopView.m
//  MyInputMethod
//
//  Created by luowei on 15/4/24.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWOftenWordsPopView.h"
#import "LWKeyboardConfig.h"
#import "UIColor+HexValue.h"

#define CELL_HEIGHT 40.0

@interface LWOftenWordsPopView () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *oftenWordsList;
@end

@implementation LWOftenWordsPopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTableView:frame];

        self.backgroundColor = [UIColor colorWithRed:0.96 green:0.85 blue:0.78 alpha:1];
    }
    
    return self;
}

- (void)setupTableView:(CGRect)frame {

    CGRect tabFrame = {0, 0, frame.size.width, frame.size.height-44.0};
    self.tableView = [[UITableView alloc] initWithFrame:tabFrame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    self.oftenWordsList = [LWKeyboardConfig getOftenuseWords];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    self.tableView.layoutMargins = UIEdgeInsetsZero;

    self.tableView.backgroundColor = [UIColor clearColor];

//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
            | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin
            | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    [self addSubview:self.tableView];

    //添加按钮
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake((CGFloat) -0.5, (CGFloat) (self.frame.size.height - 44.5),
            self.frame.size.width + 1, 44.5)];


    [addBtn setTitle:@"添加常用语" forState:UIControlStateNormal];
    [addBtn setTitleColor:Color_AddOften_Text forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];

//    addBtn.backgroundColor = Color_AddOften_BG;
    addBtn.backgroundColor = [UIColor clearColor];
    addBtn.layer.borderWidth = 0.5;
    addBtn.layer.borderColor = [UIColor grayColor].CGColor;

    UIImageView *btnImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_normal"]];
    [addBtn addSubview:btnImage];

    //添加约束
    btnImage.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *imageConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[btnImage(20)]-5-[titleLabel]" options:0 metrics:nil
                                                                                 views:@{@"btnImage":btnImage,@"titleLabel":addBtn.titleLabel}].mutableCopy;
    [imageConstraints addObject:[NSLayoutConstraint constraintWithItem:btnImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:20.0]];
    [imageConstraints addObject:[NSLayoutConstraint constraintWithItem:btnImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:addBtn.titleLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [NSLayoutConstraint activateConstraints:imageConstraints];

    [addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    addBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth
            |UIViewAutoresizingFlexibleHeight
            | UIViewAutoresizingFlexibleTopMargin;

    [self addSubview:addBtn];

}

- (void)addBtnAction {
    if (![LWKeyboardConfig isFullAccessGranted]) {
        if ([self.delegate respondsToSelector:@selector(addAlertBackgroundViewWithText:)]) {
            [self.delegate addAlertBackgroundViewWithText:@"开启“允许完全访问”才能使用自定义的常用语"];
        }
        return;
    }
    if ([self.delegate respondsToSelector:@selector(oftenWordsButtonTouchUpInside)]) {
        [self.delegate oftenWordsButtonTouchUpInside];
    }
}

- (void)updateOftenPopView {
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.oftenWordsList.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    CGSize tableViewSize = tableView.frame.size;
    UILabel *textLabel = (UILabel *) [cell.contentView viewWithTag:10];
    if (!textLabel) {
        textLabel = [[UILabel alloc] init];
        textLabel.tag = 10;
        [cell.contentView addSubview:textLabel];
    }


    UIImageView *imgView = (UIImageView *) [cell.contentView viewWithTag:11];
    if (!imgView) {
        imgView = [[UIImageView alloc] init];
        imgView.tag = 11;
        [cell.contentView addSubview:imgView];
    }

//        textLabel.frame = CGRectMake(15, 0, cellSize.width - 15, CELL_HEIGHT);
        textLabel.font = [UIFont fontWithName:@"Helvetica" size:17];
        textLabel.textColor = [UIColor blackColor];
        textLabel.text = self.oftenWordsList[(NSUInteger) indexPath.row];

        [textLabel sizeToFit];
        CGFloat textWidth = textLabel.frame.size.width;
        if (textWidth >= (tableViewSize.width - 15)) {
            textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            textWidth = tableViewSize.width - 15;
        }
        textLabel.frame = CGRectMake(15, 0, textWidth, CELL_HEIGHT);

        [imgView removeFromSuperview];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *text = nil;
    UILabel *textLabel = (UILabel *) [cell.contentView viewWithTag:10];
    if (textLabel) {
        text = textLabel.text;
    }

        if ([self.delegate respondsToSelector:@selector(commitCellSelectedStr:)]) {
            [self.delegate commitCellSelectedStr:text];
        }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor clearColor];

    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
