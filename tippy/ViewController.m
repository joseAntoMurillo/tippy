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
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipNameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self hideFeatures];
    
}

- (void)hideFeatures {
    self.tipLabel.alpha = 0;
    self.tipNameLabel.alpha = 0;
    self.totalNameLabel.alpha = 0;
    self.totalLabel.alpha = 0;
    self.tipControl.alpha = 0;
}
- (void)showFeatures {
    self.tipLabel.alpha = 1;
    self.tipNameLabel.alpha = 1;
    self.totalNameLabel.alpha = 1;
    self.totalLabel.alpha = 1;
    self.tipControl.alpha = 1;
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    if ([self.billField hasText]) {
        [self showFeatures];
        
        CGRect newFrame = self.billField.frame;
        newFrame.origin.y = 100;
        
        [UIView animateWithDuration:0.8 animations:^{
            self.billField.frame = newFrame;
        }];
    }else{
        [self hideFeatures];
        
        CGRect newFrame = self.billField.frame;
        newFrame.origin.y = 290;
        
        [UIView animateWithDuration:0.8 animations:^{
            self.billField.frame = newFrame;
        }];
    }
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

@end
