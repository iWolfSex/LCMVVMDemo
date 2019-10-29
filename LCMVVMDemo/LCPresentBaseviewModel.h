//
//  LCPresentBaseviewModel.h
//  LCMVVMDemo
//
//  Created by iWolf on 2019/10/28.
//  Copyright © 2019 iWolf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^LCSuccessBlock)(NSMutableArray*array);
typedef void (^LCFailure) (id data);
@interface LCPresentBaseviewModel : NSObject
@property(nonatomic,copy)LCSuccessBlock successBlock;
@property(nonatomic,copy)LCFailure failBlock;
-(void)initWithBlock:(LCSuccessBlock)successBlock fail:(LCFailure)failBlock;
@end

NS_ASSUME_NONNULL_END
