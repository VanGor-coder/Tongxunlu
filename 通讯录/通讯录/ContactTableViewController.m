//
//  ContactTableViewController.m
//  通讯录
//
//  Created by GaoFan on 2020/11/18.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "ContactTableViewController.h"
#import "ConntectModel.h"
#import "EditVC.h"
#import "AddVC.h"

@interface ContactTableViewController ()<UIActionSheetDelegate,UIAlertViewDelegate,AddConntactDelegate,EditContactDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = [NSString stringWithFormat:@"%@的通讯录",_accountStr];
    self.tableView.tableFooterView = [UIView new];
}

- (IBAction)loginOut:(id)sender {
    //弹框
//    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"Are you sure to login out?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Sure" otherButtonTitles:nil];
//    [action showInView:self.view];
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Are you sure to login out?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Sure", nil];
//    [alert show];
    
    //1.创建控制器
    //preferredStyle:UIAlertControllerStyleAlert、UIAlertControllerStyleActionSheet
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"确认退出?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    //2.创建按钮
    //一个UIAlertController当中,只能有一个UIAlertActionStyleCancel样式的按钮.
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮要执行的代码
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮要执行的代码
        
//        //获取文本框内容
//        UITextField *textF = alertVc.textFields[0];
//        UITextField *textF1 = alertVc.textFields[1];
//        NSLog(@"textF====%@,textF1====%@",textF.text,textF1.text);
        
        
        //返回上一级
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    
    //添加文本框,只有UIAlertControllerStyleAlert样式才可以添加文本框
//    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"请输入信息1...";
//    }];
//    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"请输入信息2...";
//    }];
    
    //3.添加按钮
    [alertVc addAction:action1];
    [alertVc addAction:action2];
    //4.显示弹框
//    [self presentViewController:alertVc animated:YES completion:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVc animated:YES completion:nil];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString * id = @"conntactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (!cell) cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:id];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    ConntectModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.nameStr;
    cell.detailTextLabel.text = model.numStr;
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[AddVC class]]) {
        AddVC *vc = segue.destinationViewController;
        //4.设置代理
        vc.delegate = self;
    }
    else
    {
        //获取当前行模型
        NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
        //把模型传递到编辑控制器
        EditVC *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.model = self.dataArray[indexpath.row];
    }
}

//实现代理方法
- (void)AddVC:(nonnull AddVC *)vc WithConntactModel:(nonnull ConntectModel *)model {
    self.model = model;
    [self.dataArray addObject:model];
    [self.tableView reloadData];
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)EditVC:(nonnull EditVC *)vc WithContactModel:(nonnull ConntectModel *)model {
    NSInteger index= [self.tableView indexPathForSelectedRow].row;
    [self.dataArray replaceObjectAtIndex:index withObject:model];
    [self.tableView reloadData];
}
@end
