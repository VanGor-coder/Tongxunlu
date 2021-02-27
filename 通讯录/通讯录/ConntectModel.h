//
//  ConntectModel.h
//  通讯录
//
//  Created by GaoFan on 2020/11/25.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConntectModel : NSObject
@property (nonatomic,copy) NSString *nameStr;   //电话
@property (nonatomic,copy) NSString *numStr;    //姓名

+(instancetype)connectModelWithName:(NSString *)name AndPhoneNumber:(NSString *)num;
@end

NS_ASSUME_NONNULL_END
