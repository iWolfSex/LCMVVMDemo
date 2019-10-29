//
//  LCPresentViewModel.m
//  LCMVVMDemo
//
//  Created by iWolf on 2019/10/28.
//  Copyright © 2019 iWolf. All rights reserved.
//

#import "LCPresentViewModel.h"
#import <ReactiveObjC.h>


@implementation LCPresentViewModel

-(instancetype)init{
    if (self == [super init]) {
//        [self addObserver:self forKeyPath:@"contentkey" options:NSKeyValueObservingOptionNew context:NULL];
        
        [RACObserve(self, contentkey) subscribeNext:^(id  _Nullable x) {
            NSArray * array = @[@"转账",@"信用卡",@"充值中心"];
            NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
            [mArray removeObject:x];
            if (self.successBlock) {
                self.successBlock(mArray);
            }
            
        }];
    }
    return self;
}
-(void)loadData{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSArray * array = @[@"转账",@"信用卡",@"充值中心"];
        NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
        dispatch_async(dispatch_get_main_queue(),^{
            if (self.successBlock) {
                self.successBlock(mArray);
            }
            
        });
    });
}
/*
#pragma mark -  kVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"change%@",change);
     NSArray * array = @[@"转账",@"信用卡",@"充值中心"];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    [mArray removeObject:change[NSKeyValueChangeNewKey]];
    if (self.successBlock) {
        self.successBlock(mArray);
    }
    
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"contentkey"];
}
 */

@end
