//
//  LCPresentViewModel.h
//  LCMVVMDemo
//
//  Created by iWolf on 2019/10/28.
//  Copyright © 2019 iWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCPresentBaseviewModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface LCPresentViewModel : LCPresentBaseviewModel
@property(nonatomic,copy) NSString * contentkey;
-(void)loadData;


@end

NS_ASSUME_NONNULL_END
