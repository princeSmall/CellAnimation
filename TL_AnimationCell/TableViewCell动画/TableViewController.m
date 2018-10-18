//
//  TableViewController.m
//  TL_AnimationCell
//
//  Created by iOS on 2017/9/12.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "TableViewController.h"
#import "Animation.h"
#import "MoveAnimationViewController.h"
#import "RotationViewController.h"
#import "KeyFrameViewController.h"

@interface TableViewController (){
    NSInteger cellNumber;
}
@property (nonatomic,strong)NSArray * animationArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.Animationtitle;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self performSelector:@selector(cellAnimation:) withObject:nil afterDelay:0.5];
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"MoveAnimationShow",@"RotationAnimationShow",@"KeyFrameAnimationShow", nil];
    }
    return _animationArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    CGFloat width = [[UIScreen mainScreen] bounds].size.width - 40;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 10, width, 60)];
    view.backgroundColor = [UIColor redColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 9.0;
    [cell.contentView addSubview:view];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row < 3) {
        UILabel * label = [[UILabel alloc]initWithFrame:view.frame];
        label.textColor = [UIColor blackColor];
        label.text = self.animationArray[indexPath.row];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
    }
  
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MoveAnimationViewController * moveVC = [[MoveAnimationViewController alloc]init];
        [self.navigationController pushViewController:moveVC animated:YES];
    }else if (indexPath.row ==1){
        RotationViewController * rotationVC = [[RotationViewController alloc]init];
        [self.navigationController pushViewController:rotationVC animated:YES];
    }else if (indexPath.row == 2){
        KeyFrameViewController * keyFrameVC = [[KeyFrameViewController alloc]init];
        [self.navigationController pushViewController:keyFrameVC animated:YES];
    }
}
-(void)cellAnimation:(UITableView *)tableView {
    cellNumber = 10;
    [self.tableView reloadData];
    tableView = self.tableView;
    [Animation addAnimationWithTableView:tableView andRow:self.type];
}
@end
