//
//  ViewController.m
//  controllers
//
//  Created by Alfred Marius Nkemla Lienou on 1/10/14.
//  Copyright (c) 2014 Alfred Marius Nkemla Lienou. All rights reserved.
//

#import "ViewController.h"


#define kTextFieldWidth         50
#define kTextFieldHeight        50
#define kHalfTextFieldWidth     25
#define kHalfTextFieldHeight    25



@interface ViewController ()
@property (nonatomic, strong) UITextField *myTextField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.myTextField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.center.x - kHalfTextFieldWidth, self.view.center.y - kHalfTextFieldHeight, kTextFieldWidth, kTextFieldHeight)];
    [self.myTextField setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.myTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
