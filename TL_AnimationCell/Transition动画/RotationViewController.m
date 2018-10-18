//
//  RotationViewController.m
//  TL_AnimationCell
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "RotationViewController.h"
#import "RotationCollectionViewCell.h"

@interface RotationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView * animationCV;


@end

NSString * CellReuseIdentify = @"CollectionViewCell";
@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.animationCV];
    
    // Do any additional setup after loading the view.
}
- (UICollectionView *)animationCV{
    if (_animationCV == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _animationCV = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _animationCV.delegate = self;
        _animationCV.backgroundColor = [UIColor whiteColor];
        _animationCV.dataSource = self;
        [_animationCV registerClass:[RotationCollectionViewCell class] forCellWithReuseIdentifier:CellReuseIdentify];
    }
    return _animationCV;

}

- (UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    RotationCollectionViewCell *cell = (RotationCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.imageView.image = [UIImage imageNamed:@"one"];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    RotationCollectionViewCell * cell = (RotationCollectionViewCell *)[self.animationCV cellForItemAtIndexPath:indexPath];
    [UIView transitionWithView:cell.imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        if ([cell.imageView.image isEqual:[UIImage imageNamed:@"two"]]) {
            cell.imageView.image = [UIImage imageNamed:@"one"];
        }else{
            cell.imageView.image = [UIImage imageNamed:@"two"];
        }
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark -- UICollectionViewDelegateFlowLayout

/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 90);
}

/** 头部的尺寸*/
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    
    return CGSizeMake(self.view.bounds.size.width, 40);
}

/** 顶部的尺寸*/
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    
    return CGSizeMake(self.view.bounds.size.width, 40);
}

/** section的margin*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
