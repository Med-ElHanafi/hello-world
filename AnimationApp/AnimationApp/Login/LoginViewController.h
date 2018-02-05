//
//  LoginViewController.h
//  AnimationApp
//
//  Created by Mint IT on 31/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *welcome;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *signin;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftE;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightE;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftP;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightP;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftS;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightS;
- (IBAction)goBack:(id)sender;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topW;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomW;

@end
