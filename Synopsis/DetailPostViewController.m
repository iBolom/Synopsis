//
//  DetailPostViewController.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "DetailPostViewController.h"

@interface DetailPostViewController ()
    
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
    
@end

@implementation DetailPostViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail";
    
    self.authorNameLabel.text = self.author;
    self.bodyTextView.text = self.body;
}

@end
