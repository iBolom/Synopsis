//
//  DetailPostViewController.h
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailPostViewController : UIViewController
    
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *body;

@end

NS_ASSUME_NONNULL_END
