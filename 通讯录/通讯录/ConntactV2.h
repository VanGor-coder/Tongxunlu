//
//  ConntactV2.h
//  通讯录
//
//  Created by GaoFan on 2020/11/25.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ConntectModel;

@interface ConntactV2 : UIViewController
@property (nonatomic,copy) NSString *accountStr;
@property (nonatomic,strong) ConntectModel *model;

@end

NS_ASSUME_NONNULL_END
