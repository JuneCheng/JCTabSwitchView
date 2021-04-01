# JCTabSwitchView
Tab切换视图


# 效果图

![A16F0C22-9B27-4E82-A0B8-B595E92AE79F](https://user-images.githubusercontent.com/36223198/113237625-c1af9400-92d9-11eb-8a0a-2cb179a01bc6.png)


# 使用方法
```
#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabSwitchView2];
}

#pragma mark - 懒加载

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

```
