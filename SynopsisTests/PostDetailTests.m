//
//  PostDetailTests.m
//  SynopsisTests
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetailPostViewController.h"
#import <AFNetworking.h>

@interface PostDetailTests : XCTestCase

@end

@implementation PostDetailTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCreatingPostDetailViewController {
    DetailPostViewController *detailPostVC = [[UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle] instantiateViewControllerWithIdentifier:NSStringFromClass(DetailPostViewController.class)];
    (void)detailPostVC.view;
    
    XCTAssertNotNil(detailPostVC);
}
    
- (void)testFetchingPostDetails {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    XCTestExpectation *expectation = [self expectationWithDescription:@"waitForGettingPostDetails"];
    [manager GET:@"http://jsonplaceholder.typicode.com/users" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nullable responseObject) {
        NSArray *responseObj = (NSArray *)responseObject;
        if (responseObj.count > 0) {
            [expectation fulfill];
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
    
    [self waitForExpectationsWithTimeout:1.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
