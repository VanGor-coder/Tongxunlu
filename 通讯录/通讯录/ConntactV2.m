//
//  ConntactV2.m
//  通讯录
//
//  Created by GaoFan on 2020/11/25.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "ConntactV2.h"
#import "AddVC.h"

//5.遵守协议
@interface ConntactV2 ()<AddConntactDelegate>
@end

@implementation ConntactV2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"%@",_accountStr);
    self.title = [NSString stringWithFormat:@"%@的通讯录",_accountStr];
}

//无论是手动型跳转还是自动型跳转都会调用该方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.destinationViewController isKindOfClass:[AddVC class]]) {
        AddVC *vc = segue.destinationViewController;
        //4.设置代理
        vc.delegate = self;
    }

}
- (void)setModel:(ConntectModel *)model
{
    _model = model;
}

//6.实现代理方法
- (void)AddVC:(AddVC *)vc WithConntactModel:(ConntectModel *)model
{
    self.model = model;
}
@end
