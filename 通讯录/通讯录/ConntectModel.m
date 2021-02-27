//
//  ConntectModel.m
//  通讯录
//
//  Created by GaoFan on 2020/11/25.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "ConntectModel.h"

@implementation ConntectModel
+(instancetype)connectModelWithName:(NSString *)name AndPhoneNumber:(NSString *)num
{
    ConntectModel *contactM = [[self alloc]init];
    contactM.nameStr = name;
    contactM.numStr = num;
    return contactM;
}
@end
