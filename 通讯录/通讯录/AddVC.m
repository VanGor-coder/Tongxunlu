//
//  AddVC.m
//  通讯录
//
//  Created by GaoFan on 2020/11/25.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "AddVC.h"
#import "ConntectModel.h"

@interface AddVC ()
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *txfNum;
@property (weak, nonatomic) IBOutlet UITextField *txfName;
@end

@implementation AddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.txfNum addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.txfName addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self textChange];
}
-(void)textChange
{
    self.addBtn.enabled = self.txfName.text.length && self.txfNum.text.length;
}

//把输入的数据传给上一级,把数据展示到view中
//点击添加按钮时调用
- (IBAction)addClick:(id)sender
{
    //把内容封装成一个模型
   ConntectModel *conneactM =  [ConntectModel connectModelWithName:self.txfName.text AndPhoneNumber:self.txfNum.text];
    //3.实现代理方法
    //通过代理方式进行传递
    //判断某一个对象有没有实现相应的方法
    NSLog(@"self.delegate == %@",self.delegate);
    if ([self.delegate respondsToSelector:@selector(AddVC:WithConntactModel:)]) {
        [self.delegate AddVC:self WithConntactModel:conneactM];
    }

    
    //把输入的数据传给上一级
//    self.conntactVC.model = conneactM;
//    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
//    //显示到上一级的页面UI上
    
}

@end
