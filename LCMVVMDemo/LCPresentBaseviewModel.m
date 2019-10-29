//
//  LCPresentBaseviewModel.m
//  LCMVVMDemo
//
//  Created by iWolf on 2019/10/28.
//  Copyright © 2019 iWolf. All rights reserved.
//

#import "LCPresentBaseviewModel.h"

@implementation LCPresentBaseviewModel

-(void)initWithBlock:(LCSuccessBlock)successBlock fail:(LCFailure)failBlock{
    _successBlock = successBlock;
    _failBlock = failBlock;
}
@end
