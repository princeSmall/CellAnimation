//
//  KeyFrameViewController.m
//  TL_AnimationCell
//
//  Created by iOS on 2017/11/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController ()
@property (nonatomic,strong)UIBezierPath * path;
@property (nonatomic,strong)UIBezierPath * path1;

@end

@implementation KeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateKeyframesWithDuration:1 delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeLinear) animations:^{
            CAShapeLayer * shapelayer = [CAShapeLayer layer];
            self.path = [UIBezierPath bezierPath];
            [self.path moveToPoint:CGPointMake(50, 200)];
            [self.path addLineToPoint:CGPointMake(200, 200)];
            [self.path addLineToPoint:CGPointMake(200, 350)];
            [self.path addLineToPoint:CGPointMake(350, 350)];
            shapelayer.path = self.path.CGPath;
            shapelayer.fillColor = [UIColor clearColor].CGColor;
            shapelayer.lineWidth = 4.0f;
            shapelayer.strokeColor = [UIColor redColor].CGColor;
            [self.view.layer addSublayer:shapelayer];
            CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnima.duration = 3.0f;
            pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
            pathAnima.fillMode = kCAFillModeForwards;
            pathAnima.removedOnCompletion = NO;
            [shapelayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
        } completion:^(BOOL finished) {
            
        }];
        [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            CAShapeLayer * shapelayer = [CAShapeLayer layer];
            self.path1 = [UIBezierPath bezierPath];
            [self.path1 moveToPoint:CGPointMake(350, 200)];
            [self.path1 addLineToPoint:CGPointMake(350, 275)];
            [self.path1 addLineToPoint:CGPointMake(50, 275)];
            [self.path1 addLineToPoint:CGPointMake(50, 350)];
            shapelayer.path = self.path1.CGPath;
            shapelayer.fillColor = [UIColor clearColor].CGColor;
            shapelayer.lineWidth = 4.0f;
            shapelayer.strokeColor = [UIColor redColor].CGColor;
            [self.view.layer addSublayer:shapelayer];
            CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnima.duration = 3.0f;
            pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
            pathAnima.fillMode = kCAFillModeForwards;
            pathAnima.removedOnCompletion = NO;
            [shapelayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
        } completion:^(BOOL finished) {
            
        }];
    });
   
    // Do any additional setup after loading the view.
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
