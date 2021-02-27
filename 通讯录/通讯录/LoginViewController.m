//
//  LoginViewController.m
//  通讯录
//
//  Created by GaoFan on 2020/11/17.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "LoginViewController.h"
#import "ConntactV2.h"
#import "EditVC.h"

#define XMGAccount @"account"
#define XMGPassword @"password"
#define XMGIsRem @"isRem"
#define XMGIsAutoLogin @"isAutoLigin"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextField *txfAccount;
@property (weak, nonatomic) IBOutlet UITextField *txfPassword;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *remChangeSwitch;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听文本框内容的改变
    /*在代理方法当中:第一次执行此方法时,文本框内容是没有值,等下一次来才有值,判断不准确*/
//    self.txfAccount.delegate = self;
//    self.txfPassword.delegate = self;
    
    [self.txfAccount addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.txfPassword addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self textChange];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    self.remChangeSwitch.on = [userDefault boolForKey:XMGIsRem];
    self.autoLoginSwitch.on = [userDefault boolForKey:XMGIsAutoLogin];
    
    //判断是否为记住密码
    if(self.remChangeSwitch.on){
        //获取用户名及密码
        self.txfAccount.text = [userDefault objectForKey:XMGAccount];
        self.txfPassword.text = [userDefault objectForKey:XMGPassword];
    }
    if(self.autoLoginSwitch.on){
        [self clickLogin:self.btnLogin];
    }
    
}

-(void)textChange
{
    
//     if (self.txfPassword.text.length && self.txfAccount.text.length) {
//            self.btnLogin.enabled = YES;
//        }
//        else
//        {
//            self.btnLogin.enabled = NO;
//        }
    
    self.btnLogin.enabled = self.txfPassword.text.length && self.txfAccount.text.length;
    
}

/*监听开关的变化*/
//1.当记住密码关闭时,自动登录关闭
//2.自动登录打开时,记住密码开关打开

//记住密码开关
- (IBAction)remChange:(id)sender {
    if (self.remChangeSwitch.on == NO) {
        //1.当记住密码关闭时,自动登录关闭
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

//自动登录开关
- (IBAction)autoLogin:(id)sender {
    if (self.autoLoginSwitch.on == YES) {
        //2.自动登录打开时,记住密码开关打开
        [self.remChangeSwitch setOn:YES animated:YES];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setBool:self.autoLoginSwitch.on forKey:XMGIsAutoLogin];
    }
}

/**
自动型跳转:直接通过控件拖线的方式进行跳转,只要一点击就会跳转 一般用于在跳转之前不需要做任何事.
 
 手动型跳转:通过控制器拖线的方式进行跳转 一般用于在跳转之前需要处理应用逻辑时使用
 需要根据标识手动执行代码.
 */
//登录名和密码同时正确时才能进行到下一级
- (IBAction)clickLogin:(UIButton *)sender {
    if ([self.txfAccount.text isEqualToString:@"gao"] && [self.txfPassword.text isEqualToString:@"123"] ) {
        NSLog(@"正确,跳转");
//        [self performSegueWithIdentifier:@"contactSegueV2" sender:nil]; //storyBoard跳转
//        ConntactV2 *vc = [[[ConntactV2 alloc]init]init];
//        [self.navigationController pushViewController:vc animated:YES];
//        vc.accountStr = self.txfAccount.text;
        [self performSegueWithIdentifier:@"contactSegue" sender:nil];
        
        //保存用户偏好
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:self.txfAccount.text forKey:XMGAccount];
        [userDefault setObject:self.txfPassword.text forKey:XMGPassword];
        [userDefault setBool:self.autoLoginSwitch.on forKey:XMGIsAutoLogin];
        [userDefault setBool:self.remChangeSwitch forKey:XMGIsRem];
    }
    else{
        NSLog(@"输入错误");
        [self performSegueWithIdentifier:@"contactSegue" sender:nil];
    }
}
/**
 performSegueWithIdentifier:方法的内部实现
 
 1.根据标识在storyBoard中查找指定标识,若没有直接报错;若有则执行下一步
 2.创建segue对象(UIStoryboardSegue *)segue
 3.给segue对象的属性赋值,segue.sourceViewContrller = self;
 4.创建箭头指向的控制器,(UIViewController *)vc = [UIViewController new];
   给segue的目标控制器赋值,segue.destinationViewController = vc;
 5.会调用当前控制器的prepareForSegue:方法,告诉你segue已经准备好跳转,在此方法可以获取要跳转的控制器,有没有数据传递给目标控制器
 6.真正实现跳转是segue的perform方法.[segue perform];
 
 [segue.sourceViewContrller.navigationController pushViewController:segue.destinationViewController animateted:YES];
 
 */

/***
 当执行performSegueWithIdentifier之后
 在跳转之前会调用一个方法prepareForSegue:
 在此方法当中就可以获取要跳转的控制器
 通过UIStoryboardSegue的sourceViewController(目标控制器:->segue指向的控制器)
 
 
 
 //数据顺传
 1.在数据要接收的控制器当中定义属性接收数据
 2.获取数据要接收的控制器
 3.把数据传给要接收的控制器的对应属性
 *
 
 */


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ConntactV2 *v2 = segue.destinationViewController;
    v2.accountStr = self.txfAccount.text;
    NSLog(@"%@",segue.destinationViewController);
}



////思路一
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    /*第一次执行此方法时,文本框内容是没有值,等下一次来才有值,判断不准确*/
//    //判断账号密码同时有值时,让登录按钮能够点击
//    if (self.txfPassword.text.length >0 && self.txfAccount.text.length >0) {
//        self.btnLogin.enabled = YES;
//    }
//    else
//    {
//        self.btnLogin.enabled = NO;
//    }
//    return YES;
//}

@end
