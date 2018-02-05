//
//  ViewController.m
//  AnimationApp
//
//  Created by Mint IT on 30/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *imageNames = @[@"1", @"2", @"3", @"4",
                            @"5", @"6", @"7", @"8",
                            @"9", @"10", @"11", @"12",
                            @"13"];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    _imageView.animationImages=images;
    _imageView.animationDuration=2;
    [_imageView startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)animate:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        _bird.frame=CGRectMake(_bird.frame.origin.x+170, _bird.frame.origin.y+490, 40, 40);
        _bird.transform=CGAffineTransformRotate(_bird.transform,3*M_PI);
    } completion:^(BOOL finished) {
        _bird.hidden=YES;
    }];
}

- (IBAction)restoreBird:(id)sender {
            [UIView animateWithDuration:1 animations:^{
                _bird.frame=CGRectMake(_bird.frame.origin.x-170, _bird.frame.origin.y-490, 40, 40);
                _bird.hidden=NO;
            }];
}

- (IBAction)next:(id)sender {
    LoginViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewControllerID"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
