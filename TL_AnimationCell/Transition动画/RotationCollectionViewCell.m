//
//  RotationCollectionViewCell.m
//  TL_AnimationCell
//
//  Created by tongle on 2017/11/22.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "RotationCollectionViewCell.h"

@implementation RotationCollectionViewCell



- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.frame];
//        _imageView.image = [UIImage imageNamed:@"one"];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

@end
