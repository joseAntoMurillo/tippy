//
//  ViewController.m
//  tippy
//
//  Created by josemurillo on 6/25/19.
//  Copyright © 2019 josemurillo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * 0.2;
    double total = 
    
    self.tipLabel.text = @"$10.00";
    self.totalLabel.text = @"$10.00";
}

@end
