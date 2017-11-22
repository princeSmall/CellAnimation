![CellAnimation](GIF/AnimationView.gif)


### Animation

<pre>
+(void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;
duration : 动画时间
delay : 延迟时间
options : 动画的方式，so much...
animation : 需要执行的动作
completion : 完成后的方法，可以为空
</pre>

#### 案例，登录注册的左移，右移和透明

    [UIView animateWithDuration:1 animations:^{
        CGFloat x = self.nameTextField.frame.origin.x;
        x += Width - 40;
        self.nameTextField.alpha = 1.0;
        [self.nameTextField setFrame:CGRectMake(x, 100, Width - 80, 50)];
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:1 delay:0.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        CGFloat x = self.passwordTextField.frame.origin.x;
        x -= Width - 40;
        self.passwordTextField.alpha = 1.0;
        [self.passwordTextField setFrame:CGRectMake(x, 200, Width - 80, 50)];
    } completion:^(BOOL finished) {

    }];
    [UIView animateWithDuration:1 delay:1 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.loginBtn.alpha =1.0;
        [self.loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        
    }];
    
    目前动画实现登录注册就好了

### Transition
<pre>
+(void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;
view : 需要变换的视图
duration : 动画的时间
options : 动画的方式， so much...
animation : 需要执行的动作
completion : 完成后的方法，可以为空
</pre>

#### 案例，点击切换图片

    [UIView transitionWithView:cell.imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        if ([cell.imageView.image isEqual:[UIImage imageNamed:@"two"]]) {
            cell.imageView.image = [UIImage imageNamed:@"one"];
        }else{
            cell.imageView.image = [UIImage imageNamed:@"two"];
        }
    } completion:^(BOOL finished) {
        
    }];
    
    目前点击动画翻页就好了
    
    
#### KeyFrame
<pre>
+(void)animateKeyframesWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewKeyframeAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;
duration : 动画时间
delay : 延迟时间
options : 动画方式， so much...
animation : 需要执行的动作
completion : 完成后的方法，可以为空
</pre>

#### 案例，移动画线

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
    
    目前一条移动的线条就好了

### 使用：
导入Animation类，直接用类调用,输入要动画的tableview和动画type，即可
<pre>
 [Animation addAnimationWithTableView:tableView andRow:self.type];
</pre>

### UITableViewCell 出场动画：

简而明了的说就是利用cell的contentView来做一下出场动画animation

<pre>
 CGFloat width = [[UIScreen mainScreen] bounds].size.width - 40;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 10, width, 60)];
    view.backgroundColor = [UIColor redColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 9.0;
    [cell.contentView addSubview:view];
</pre>

### UIView

#### move动画
<pre>
+ (void)moveAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        CGFloat totalTime = 0.4;
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-XS_SCREEN_WIDTH, 0);
        [UIView animateWithDuration:0.4 delay:i*(totalTime/cells.count) usingSpringWithDamping:0.7 initialSpringVelocity:1/0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
</pre>

#### alpha动画
<pre>
+ (void)alphaAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.alpha = 0.0;
        [UIView animateWithDuration:0.3 delay:i*0.05 options:0 animations:^{
            cell.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }
}
</pre>

#### fall动画
<pre>
+ (void)fallAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    
    NSTimeInterval totalTime = 0.8;
    
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, - XS_SCREEN_HEIGHT);
        [UIView animateWithDuration:0.3 delay:(cells.count - i)*(totalTime/cells.count) options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
</pre>

#### shake动画
<pre>
+ (void)shakeAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        if (i%2 == 0) {
            cell.transform = CGAffineTransformMakeTranslation(-XS_SCREEN_WIDTH,0);
        }else {
            cell.transform = CGAffineTransformMakeTranslation(XS_SCREEN_WIDTH,0);
        }
        [UIView animateWithDuration:0.4 delay:i*0.03 usingSpringWithDamping:0.75 initialSpringVelocity:1/0.75 options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
</pre>

#### overTurn动画
<pre>
+ (void)overTurnAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        cell.layer.opacity = 0.0;
        cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
        NSTimeInterval totalTime = 0.7;
        [UIView animateWithDuration:0.3 delay:i*(totalTime/cells.count) options:0 animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
        
    }
}
</pre>

#### toTop动画
<pre>
+ (void)toTopAnimationWithTableView:(UITableView *)tableView {
    
    
    NSArray *cells = tableView.visibleCells;
    
    NSTimeInterval totalTime = 0.8;
    
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [tableView.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0,  XS_SCREEN_HEIGHT);
        [UIView animateWithDuration:0.35 delay:i*(totalTime/cells.count) options:UIViewAnimationOptionCurveEaseOut animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
</pre>

#### spring动画
<pre>
+ (void)springListAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        cell.layer.opacity = 0.7;
        cell.layer.transform = CATransform3DMakeTranslation(0, -XS_SCREEN_HEIGHT, 20);
        NSTimeInterval totalTime = 1.0;
        
        [UIView animateWithDuration:0.4 delay:i*(totalTime/cells.count) usingSpringWithDamping:0.65 initialSpringVelocity:1/0.65 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
        } completion:^(BOOL finished) {
            
        }];
    }
}
</pre>

#### shrink动画
<pre>
+ (void)shrinkToTopAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = [cell convertRect:cell.bounds fromView:tableView];
        cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}
</pre>

### laydown动画
<pre>
+ (void)layDownAnimationWithTableView:(UITableView *)tableView {
    NSArray *cells = tableView.visibleCells;
    NSMutableArray *rectArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = cell.frame;
        [rectArr addObject:[NSValue valueWithCGRect:rect]];
        rect.origin.y = i * 10;
        cell.frame = rect;
        cell.layer.transform = CATransform3DMakeTranslation(0, 0, i*5);
    }
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
        [UIView animateWithDuration:(totalTime/cells.count) * i animations:^{
            cell.frame = rect;
        } completion:^(BOOL finished) {
            cell.layer.transform = CATransform3DIdentity;
        }];
    }
    
}
</pre>

#### rote动画
<pre>
+ (void)roteAnimationWithTableView:(UITableView *)tableView {
    
    NSArray *cells = tableView.visibleCells;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.fromValue = @(-M_PI);
    animation.toValue = 0;
    animation.duration = 0.3;
    animation.removedOnCompletion = NO;
    animation.repeatCount = 3;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell *cell = [cells objectAtIndex:i];
        
        cell.alpha = 0.0;
        [UIView animateWithDuration:0.1 delay:i*0.25 options:0 animations:^{
            cell.alpha = 1.0;
        } completion:^(BOOL finished) {
            [cell.layer addAnimation:animation forKey:@"rotationYkey"];
        }];
    }
}
</pre>


