//
//  AddVC.h
//  通讯录
//
//  Created by GaoFan on 2020/11/25.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ConntactV2.h"

NS_ASSUME_NONNULL_BEGIN

// 1.定义协议
@class AddVC,ConntectModel;
@protocol AddConntactDelegate <NSObject>

-(void)AddVC:(AddVC *)vc WithConntactModel:(ConntectModel *)model;

@end

@class AddConntactDelegate;
@interface AddVC : UIViewController
//@property (nonatomic,strong)ConntactV2 *conntactVC;
// 2.定义代理属性
@property (nonatomic,weak) id<AddConntactDelegate> delegate;
//通过代理的方式进行传递
/**
 什么情况下使用代理
 
 当上下级之间
 下级要通知上级做事情,想传递数据给上一级
 当发生某一个事情,把数据传给上一级,通知上一级把数据显示到页面当中.
 
 代理是一对一
 通知是一对多.
 
 
 
 写代理的过程
 1.定义协议
 2.定义代理属性
 3.调用代理方法
 4.设置代理
 5.遵守协议
 6.实现代理方法
 */
@end


NS_ASSUME_NONNULL_END

