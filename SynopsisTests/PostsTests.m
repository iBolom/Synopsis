//
//  PostsTests.m
//  SynopsisTests
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PostsViewController.h"
#import <AFNetworking.h>

@interface PostsTests : XCTestCase

@end

@implementation PostsTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}
    
- (void)testCreatingPostsViewController {
    PostsViewController *postViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle] instantiateViewControllerWithIdentifier:NSStringFromClass(PostsViewController.class)];
    (void)postViewController.view;
    
    XCTAssertNotNil(postViewController);
}
    
- (void)testFetchingPosts {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    XCTestExpectation *expectation = [self expectationWithDescription:@"waitForGettingPosts"];
    [manager GET:@"http://jsonplaceholder.typicode.com/posts" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nullable responseObject) {
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
