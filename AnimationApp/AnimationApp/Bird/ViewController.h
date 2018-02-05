//
//  ViewController.h
//  AnimationApp
//
//  Created by Mint IT on 30/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIImageView *bird;
- (IBAction)animate:(id)sender;
- (IBAction)restoreBird:(id)sender;
- (IBAction)next:(id)sender;

@end

