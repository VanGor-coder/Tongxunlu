//
//  EditVC.h
//  通讯录
//
//  Created by GaoFan on 2020/11/28.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ConntectModel,EditVC;
@protocol EditContactDelegate <NSObject>
-(void)EditVC:(EditVC *)vc WithContactModel:(ConntectModel *)model;
@end


//@class ConntectModel;
@interface EditVC : UIViewController
@property (nonatomic,strong) ConntectModel *model;

//使用weak修饰的原因
//1.避免造成循环引用
//2.不去牵扯到外界对象的生命周期
@property (nonatomic,weak) id<EditContactDelegate> delegate;
@end


NS_ASSUME_NONNULL_END
