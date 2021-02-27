//
//  ContactTableViewController.h
//  通讯录
//
//  Created by GaoFan on 2020/11/18.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ConntectModel;
@interface ContactTableViewController : UITableViewController
@property (nonatomic,copy) NSString *accountStr;
@property (nonatomic,strong) ConntectModel *model;
@end

NS_ASSUME_NONNULL_END
