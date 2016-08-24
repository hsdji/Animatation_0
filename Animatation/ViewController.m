//
//  ViewController.m
//  Animatation
//
//  Created by 小飞 on 16/7/27.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *MyimageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.MyimageView];
    self.MyimageView.frame = CGRectMake(100, 100, 100, 100);
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(130, 400, 100, 40)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn setTitle:@"位置大小动画改变frame" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(130, 320, 100, 40)];
    btn2.backgroundColor = [UIColor orangeColor];
    [btn2 setTitle:@"拉伸动画改变bounds" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(lashen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(130, 460, 100, 40)];
    [btn3 setTitle:@"转移动画  改变center" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor purpleColor];
    [btn3 addTarget:self action:@selector(zhuanyidonghua) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(0, 320, 100, 40)];
    [btn4 setTitle:@"旋转动画" forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor greenColor];
    [btn4 addTarget:self action:@selector(xuanzhuan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]initWithFrame:CGRectMake(0, 460, 100, 40)];
    [btn5 setTitle:@"透明度改变alpha" forState:UIControlStateNormal];
    btn5.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    [btn5 addTarget:self action:@selector(Myalpha) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc]initWithFrame:CGRectMake(0, 400, 100, 40)];
    [btn6 setTitle:@"修改背景色 Keyframes" forState:UIControlStateNormal];
    btn6.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255/255.0) green:arc4random_uniform(255/255.0) blue:arc4random_uniform(255/255.0) alpha:1.0];
    [btn6 addTarget:self action:@selector(backColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];

}
//修改背景色
-(void)backColor{
    for (int i =0; i<10; i++)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.MyimageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255/255.0) green:arc4random_uniform(255/255.0) blue:arc4random_uniform(255/255.0) alpha:1.0];
        } completion:^(BOOL finished) {
            self.MyimageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255/255.0) green:arc4random_uniform(255/255.0) blue:arc4random_uniform(255/255.0) alpha:1.0];
        }];
        if (i == 9)
        {
            [UIView animateWithDuration:1.0 animations:^{
                self.MyimageView.backgroundColor = [UIColor whiteColor];
            }];
        }
    }
}




//修改alpha

-(void)Myalpha{
    [UIView animateWithDuration:2 animations:^{
        self.MyimageView.alpha = 0.3;
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:2 animations:^{
          self.MyimageView.alpha = 1.0
           ;
       }];
    }];
}






//旋转动画
-(void)xuanzhuan{
    CGAffineTransform originalTransform = self.MyimageView.transform;
    //CGAffineTransform transform = CGAffineTransformMakeScale(0.6, 0.6);//缩放
    [UIView animateWithDuration:2 animations:^{
        self.MyimageView.transform = CGAffineTransformMakeRotation(4.0f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
           self.MyimageView.transform= originalTransform;
        }];
    }];
    
}
//转移动画  改变center
-(void)zhuanyidonghua{
    CGPoint originalPoint = self.MyimageView.center;
    CGPoint point = CGPointMake(self.MyimageView.frame.origin.x, self.MyimageView.frame.origin.y);
    [UIView animateWithDuration:1.0 animations:^{
        self.MyimageView.center = point;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
           self.MyimageView.center = originalPoint;
        }];
    }];
}




//拉伸动画
-(void)lashen{
    CGRect originalBounds = self.MyimageView.bounds;
    CGRect rect = CGRectMake(0, 0, 300, 200);
    [UIView animateWithDuration:1.0 animations:^{
        self.MyimageView.bounds = rect;
    } completion:^(BOOL finished) {
        self.MyimageView.bounds = originalBounds;
    }];
}

//位置大小动画
-(void)action{
    CGRect originarect = self.MyimageView.frame;
    CGRect rect = CGRectMake(self.MyimageView.frame.origin.x-20, self.MyimageView.frame.origin.y-100, 100, 100);

    [UIView animateWithDuration:1.0 animations:^{
        self.MyimageView.frame = rect;
    } completion:^(BOOL finished) {
        self.MyimageView.frame = originarect;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)MyimageView {
	if(_MyimageView == nil) {
		_MyimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4s-2"]];
	}
	return _MyimageView;
}

@end
