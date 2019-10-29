//
//  LCPresentViewController.m
//  LCMVVMDemo
//
//  Created by iWolf on 2019/10/28.
//  Copyright © 2019 iWolf. All rights reserved.
//

#import "LCPresentViewController.h"
#import "LCPresentViewModel.h"
@interface LCPresentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * myTableView;
@property(nonatomic,strong)LCPresentViewModel * mv;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)UIButton *reloadDataButton;


@end

@implementation LCPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc] init];
    [self.view addSubview:self.reloadDataButton];
    [self.view addSubview:self.myTableView];
    __weak typeof (self) weakSelf = self;
    
    //model 绑定 UI
    self.mv = [[LCPresentViewModel alloc] init];
    [self.mv initWithBlock:^(NSMutableArray*array){
        __strong typeof (self) strongSelf = weakSelf;
        NSMutableArray * arrays = array;
        [strongSelf.dataArray removeAllObjects];
        [strongSelf.dataArray addObjectsFromArray:arrays];
        [self.myTableView reloadData];
        
    } fail:^(id data){
        
    }];
    
    //总结：MVVM
    //view model 间的通讯
    //建立双向绑定 view <-->model
    //model 绑定 UI 使用 block 保存代码块 刷新UI的代码只需要写一遍
    //UI 绑定 model 使用 KVO 或者是 RAC
    
    // Do any additional setup after loading the view.
}

-(void)clickReloadData{
    [self.mv loadData];
}

- (UITableView *)myTableView{
    if (_myTableView == nil) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 108, self.view.frame.size.width,self.view.frame.size.height - 108)];
        _myTableView.delegate = self;
        _myTableView.dataSource =self;
    }
    return _myTableView;
}
-(UIButton *)reloadDataButton{
    if (_reloadDataButton == nil) {
        _reloadDataButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
        [_reloadDataButton setTitle:@"刷新" forState:UIControlStateNormal];
        [_reloadDataButton addTarget:self action:@selector(clickReloadData) forControlEvents:UIControlEventTouchUpInside];
        [_reloadDataButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    return _reloadDataButton;
}


#pragma mark - UITableView - delegate - dataSource

// 返回每组多少条
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray count];
    
}

// 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

// 返回Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.mv.contentkey = self.dataArray[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark UIActionSheetDelegate
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
