//
//  ViewController.m
//  JCTabSwitchView
//
//  Created by JuneCheng on 2021/4/1.
//

#import "ViewController.h"
#import "JCTabSwitchView.h"

#define appThemeColor [UIColor colorWithRed:23/255.0 green:134/255.0 blue:251/255.0 alpha:1.0]

@interface ViewController ()

@property (nonatomic, strong) JCTabSwitchView *tabSwitchView;///<
@property (nonatomic, strong) JCTabSwitchView *tabSwitchView2;///<

@end

@implementation ViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"JCTabSwitchView";
    self.navigationItem.titleView = self.tabSwitchView;
    
    [self.view addSubview:self.tabSwitchView2];
}

#pragma mark - 懒加载

- (JCTabSwitchView *)tabSwitchView {
    if (!_tabSwitchView) {
        CGRect rect = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-120, 30);
        _tabSwitchView = [[JCTabSwitchView alloc] initWithFrame:rect tabTitles:@[@"场景分类", @"地市分类", @"热度排行"] selectColor:appThemeColor normalColor:[UIColor whiteColor]];
        _tabSwitchView.selectIndexBlock = ^(NSInteger index) {
            NSLog(@"index--->%ld",(long)index);
        };
    }
    return _tabSwitchView;
}

- (JCTabSwitchView *)tabSwitchView2 {
    if (!_tabSwitchView2) {
        CGRect rect = CGRectMake(60, 100, [[UIScreen mainScreen] bounds].size.width-120, 30);
        _tabSwitchView2 = [[JCTabSwitchView alloc] initWithFrame:rect tabTitles:@[@"场景分类", @"地市分类", @"热度排行"] selectColor:appThemeColor normalColor:[UIColor whiteColor]];
        _tabSwitchView2.selectIndexBlock = ^(NSInteger index) {
            NSLog(@"index--->%ld",(long)index);
        };
    }
    return _tabSwitchView2;
}

@end
