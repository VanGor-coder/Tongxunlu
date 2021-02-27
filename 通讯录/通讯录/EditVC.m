//
//  EditVC.m
//  通讯录
//
//  Created by GaoFan on 2020/11/28.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "EditVC.h"
#import "ConntectModel.h"

@interface EditVC ()
@property (weak, nonatomic) IBOutlet UITextField *lbName;
@property (weak, nonatomic) IBOutlet UITextField *lbNum;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation EditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //如果想要给控制器view内部的子控件赋值,必须得在viewDidLoa当中执行.
    self.lbName.text = self.model.nameStr;
    self.lbNum.text = self.model.numStr;
    self.lbName.enabled = NO;
    self.lbNum.enabled = NO;
}
- (IBAction)editClick:(id)sender {
//    self.editBtn.enabled = !self.editBtn.isEnabled ;

    if ([self.editBtn.title isEqualToString:@"编辑"]) {
        self.editBtn.title = @"取消";
        self.lbName.enabled = YES;
        self.lbNum.enabled = YES;
    }
    else{
        self.editBtn.title = @"编辑";
        self.lbName.enabled = NO;
        self.lbNum.enabled = NO;
        
        //取消
        self.lbName.text = self.model.nameStr;
        self.lbNum.text = self.model.numStr;
        
    }
    self.saveBtn.hidden = [self.editBtn.title isEqualToString:@"编辑"];
    
    //弹出键盘
    [self.lbNum resignFirstResponder];
}
- (IBAction)saveData:(id)sender {

//    [self editClick:self.editBtn];
    //修改数据
    self.model.nameStr = self.lbName.text;
    self.model.numStr = self.lbNum.text;
    
    //返回上一级,通知上一级刷新数据
    if ([self.delegate respondsToSelector:@selector(EditVC:WithContactModel:)]) {
        [self.delegate EditVC:self WithContactModel:self.model];
    }
    
    //刷新数据
    [self.navigationController popViewControllerAnimated:YES];
}

//控制器view是懒加载的、88
//- (void)setModel:(ConntectModel *)model
//{
//
//    NSLog(@"self.lbName===%@,self.lbNun===%@",self.lbName,self.lbNum);//结果为空
//    _model = model;
//    self.lbName.text = self.model.nameStr;
//    self.lbNum.text = self.model.numStr;
//}
@end
