//
//  ViewController.m
//  TL_AnimationCell
//
//  Created by iOS on 2017/9/12.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * TLTableView;
@property (nonatomic,copy)  NSArray * titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TLTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.TLTableView.delegate = self;
    self.TLTableView.dataSource = self;
    [self.view addSubview:self.TLTableView];
    self.title = @"AnimationCellShow";
    self.titleArray = [[NSArray alloc]initWithObjects:@"MoveAnimation",@"AlphaAnimation",@"FallAnimation",@"ShakeAnimation",@"OverturnAnimation",@"TotopAnimation",@"SpringAnimation",@"SharinkAnimation",@"LaydownAnimation",@"RoteAnimation", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    CGFloat R,G,B;
    R = (arc4random() % 256) / 255.0;
    G = (arc4random() % 256) / 255.0;
    B = (arc4random() % 256) / 255.0;
    cell.textLabel.textColor = [UIColor colorWithRed:R green:G blue:B alpha:1.0];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewController * t = [[TableViewController alloc]init];
    t.type = indexPath.row;
    t.Animationtitle = self.titleArray[indexPath.row];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [self.navigationController pushViewController:t animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
