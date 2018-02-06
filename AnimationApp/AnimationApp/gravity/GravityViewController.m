//  GravityViewController.m
//  AnimationApp
//
//  Created by Mint IT on 31/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()<UICollisionBehaviorDelegate>
{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
    UIPanGestureRecognizer *recognizer;
    UITapGestureRecognizer *tap;
    UIView* barrier;
    UIView* square;
}
@end

@implementation GravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    barrier = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 130, 20)];
    barrier.tag=2;
    barrier.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:barrier];
    
    square = [[UIView alloc] initWithFrame:
                      CGRectMake(100, 100, 100, 100)];
    square.tag=1;
    square.backgroundColor = [UIColor grayColor];
    [self.view addSubview:square];
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[square]];
    _gravity.magnitude=0.2;
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc]
                  initWithItems:@[square,barrier]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    // add a boundary that coincides with the top edge
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    _collision.collisionDelegate = self;
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
    itemBehaviour.elasticity = 1;
    [_animator addBehavior:itemBehaviour];
    
    recognizer=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [square addGestureRecognizer:recognizer];
    
    tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [square addGestureRecognizer:tap];
}
-(void)handleTap:(UITapGestureRecognizer*)tapGesture{
    [_animator removeAllBehaviors];
    square.center=CGPointMake(square.center.x, square.center.y-70);
    [_animator addBehavior:_collision];
            [_animator addBehavior:_gravity];
            UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
            itemBehaviour.elasticity = 1;
            [_animator addBehavior:itemBehaviour];
            [_animator addBehavior:itemBehaviour];
}
-(void)handleGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    
    if (panGestureRecognizer.state==UIGestureRecognizerStateBegan) {
        [_animator removeAllBehaviors];
        CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
        square.center = touchLocation;
    }else if (panGestureRecognizer.state==UIGestureRecognizerStateChanged){
        CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
        square.center = touchLocation;
    }else if(panGestureRecognizer.state==UIGestureRecognizerStateEnded){
        [_animator addBehavior:_collision];
        [_animator addBehavior:_gravity];
        UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
        itemBehaviour.elasticity = 1;
        [_animator addBehavior:itemBehaviour];
        [_animator addBehavior:itemBehaviour];
    }
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    NSLog(@"Boundary contact occurred - %@", identifier);
    UIView* view = (UIView*)item;
    UIColor *color=self.view.backgroundColor;
    if (view.tag==1) {
        [UIView animateWithDuration:0.3 animations:^{
            view.backgroundColor=[UIColor yellowColor];
            self.view.backgroundColor = [UIColor redColor];
        } completion:^(BOOL finished) {
            view.backgroundColor=[UIColor grayColor];
            self.view.backgroundColor=color;
        }];
    }
    
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
