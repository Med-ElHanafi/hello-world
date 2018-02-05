//
//  TennisViewController.m
//  AnimationApp
//
//  Created by Mint IT on 01/02/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "TennisViewController.h"

@interface TennisViewController ()
{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
    UIDynamicItemBehavior *itemBehaviour;
    UIPanGestureRecognizer *recognizer;
    UIImageView *ball;
    UIView *barrier;
}
@end

@implementation TennisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViews];
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _gravity=[[UIGravityBehavior alloc] initWithItems:@[ball]];
    _collision=[[UICollisionBehavior alloc]initWithItems:@[ball,barrier]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[ball]];
    itemBehaviour.elasticity = 1;
    
    [_animator addBehavior:itemBehaviour];
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    [_animator addBehavior:itemBehaviour];
    
    recognizer=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [barrier addGestureRecognizer:recognizer];
}
-(void)handlePan:(UIPanGestureRecognizer*)pan{
    CGPoint vel = [pan velocityInView:self.view];
    [_animator removeAllBehaviors];
    if (vel.x > 0)
    {
        // user dragged towards the right
        barrier.center =CGPointMake(barrier.center.x+100, barrier.center.y);
    }
    else
    {
        // user dragged towards the left
        barrier.center = CGPointMake(barrier.center.x-100, barrier.center.y);
    }
    [_animator addBehavior:_collision];
    [_animator addBehavior:_gravity];
    [_animator addBehavior:itemBehaviour];
}
-(void)setViews{
    ball=[[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 30, 30)];
    ball.image=[UIImage imageNamed:@"ball"];
    barrier=[[UIView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.bounds.size.height-30, 100, 30)];
    barrier.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:ball];
    [self.view addSubview:barrier];
}
- (IBAction)tapRight:(id)sender {
    [_animator removeAllBehaviors];
    [UIView animateWithDuration:0.1 animations:^{
        barrier.center =CGPointMake(barrier.center.x+100, barrier.center.y);
    }];
    [_animator addBehavior:_collision];
    [_animator addBehavior:_gravity];
    [_animator addBehavior:itemBehaviour];
    
}

- (IBAction)tapLeft:(id)sender {
    [_animator removeAllBehaviors];
    [UIView animateWithDuration:0.1 animations:^{
       barrier.center = CGPointMake(barrier.center.x-100, barrier.center.y);
    }];
    [_animator addBehavior:_collision];
    [_animator addBehavior:_gravity];
    [_animator addBehavior:itemBehaviour];
}
@end
