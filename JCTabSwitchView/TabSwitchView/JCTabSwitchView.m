//
//  JCTabSwitchView.m
//  MobileCMS3
//
//  Created by JuneCheng on 2021/3/29.
//  Copyright © 2021 zjhcsoft. All rights reserved.
//

#import "JCTabSwitchView.h"

@interface JCTabSwitchView () {
    UIColor *selectColor;
    UIColor *bgColor;
    UIButton *previousBtn;
    NSMutableArray<UIButton*> *btnArr;
}

@end

@implementation JCTabSwitchView

- (instancetype)initWithFrame:(CGRect)frame tabTitles:(NSArray *)titles selectColor:(UIColor *)selectColor normalColor:(UIColor *)normalColor {
    self = [super initWithFrame:frame];
    if (self) {
        btnArr = [NSMutableArray array];
        self->selectColor = selectColor;
        bgColor = normalColor;
        // 根据frame计算控件的宽高
        CGFloat viewWidth = frame.size.width;// view宽度
        CGFloat viewHeight = frame.size.height;// view高度
        NSInteger lineCount = titles.count - 1;// 竖线条数
        CGFloat btnWidth = (viewWidth-lineCount*1)/titles.count;// 按钮宽度
        // 创建底层view
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, viewWidth, viewHeight);
        view.backgroundColor = bgColor;
        view.layer.cornerRadius = frame.size.height*0.5;
        view.layer.borderWidth = 1;
        view.layer.borderColor = selectColor.CGColor;
        view.layer.masksToBounds = YES;
        [self addSubview:view];
        
        for (int i = 0; i < titles.count; i ++) {
            // 创建按钮
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake((btnWidth+1)*i, 0, btnWidth, viewHeight);
            button.backgroundColor = bgColor;
            [button setTitle:titles[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize: 15];
            [button setTitleColor:selectColor forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self action:@selector(tabClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            // 创建线条
            if (i < titles.count - 1) {
                UIView *line = [[UIView alloc] init];
                line.frame = CGRectMake(btnWidth*(i+1)+i, 0, 1, viewHeight);
                line.backgroundColor = selectColor;
                [view addSubview:line];
            }
            [btnArr addObject:button];
        }
        [self tabClick:btnArr[0]];
    }
    return self;
}

- (void)tabClick:(id)sender {
    UIButton *selectBtn = ((UIButton*)sender);
    if (previousBtn && selectBtn.tag == previousBtn.tag) {
        return;
    }
    selectBtn.backgroundColor = selectColor;
    [selectBtn setTitleColor:bgColor forState:UIControlStateNormal];
    previousBtn.backgroundColor = bgColor;
    [previousBtn setTitleColor:selectColor forState:UIControlStateNormal];
    previousBtn = selectBtn;
    if (self.selectIndexBlock) {
        self.selectIndexBlock(selectBtn.tag);
    }
}

@end
