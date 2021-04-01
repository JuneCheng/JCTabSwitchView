//
//  JCTabSwitchView.h
//  MobileCMS3
//
//  Created by JuneCheng on 2021/3/29.
//  Copyright © 2021 zjhcsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TabSelectIndexBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface JCTabSwitchView : UIView

- (instancetype)initWithFrame:(CGRect)frame tabTitles:(NSArray *)titles selectColor:(UIColor *)selectColor normalColor:(UIColor *)normalColor;

@property (nonatomic, copy) TabSelectIndexBlock selectIndexBlock;

@end

NS_ASSUME_NONNULL_END
