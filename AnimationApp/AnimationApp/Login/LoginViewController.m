//
//  LoginViewController.m
//  AnimationApp
//
//  Created by Mint IT on 31/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self subsctractConstraints];
}
-(void)viewDidAppear:(BOOL)animated{
    [self animateViews];
}

-(void)animateViews{
    [UIView animateWithDuration:0.5 animations:^{
        _welcome.frame=CGRectMake(_welcome.frame.origin.x, _welcome.frame.origin.y+self.view.bounds.size.height, _welcome.frame.size.width, _welcome.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.7 animations:^{
            _email.frame=CGRectMake(_email.frame.origin.x+self.view.bounds.size.width, _email.frame.origin.y, _email.frame.size.width, _email.frame.size.height);
            _password.frame=CGRectMake(_password.frame.origin.x+self.view.bounds.size.width, _password.frame.origin.y, _password.frame.size.width, _password.frame.size.height);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                _signin.frame=CGRectMake(_signin.frame.origin.x-self.view.bounds.size.width, _signin.frame.origin.y, _signin.frame.size.width, _signin.frame.size.height);
            } completion:^(BOOL finished) {
                [self addConstraints];
            }];
        }];
    }];
    
}
-(void)subsctractConstraints{
    _topW.constant-=self.view.bounds.size.height;
    _bottomW.constant+=self.view.bounds.size.height;
    
    _leftE.constant-=self.view.bounds.size.width;
    _rightE.constant+=self.view.bounds.size.width;
    
    _leftP.constant-=self.view.bounds.size.width;
    _rightP.constant+=self.view.bounds.size.width;
    
    _leftS.constant+=self.view.bounds.size.width;
    _rightS.constant-=self.view.bounds.size.width;
}
-(void)addConstraints{
    _topW.constant+=self.view.bounds.size.height;
    _bottomW.constant-=self.view.bounds.size.height;
    
    _leftE.constant+=self.view.bounds.size.width;
    _rightE.constant-=self.view.bounds.size.width;
    
    _leftP.constant+=self.view.bounds.size.width;
    _rightP.constant-=self.view.bounds.size.width;
    
    _leftS.constant-=self.view.bounds.size.width;
    _rightS.constant+=self.view.bounds.size.width;
}
@end
