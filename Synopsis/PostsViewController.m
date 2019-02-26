//
//  PostsViewController.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "PostsViewController.h"
#import "PostsTableViewCell.h"
#import "Post.h"
#import "DetailPostViewController.h"
#import "PostDetail.h"
#import <AFNetworking/AFNetworking.h>
#import <UIKit/UIKit.h>

@interface PostsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property NSInteger selectedPostRow;
@property (nonatomic, strong) NSMutableArray<Post*> *posts;
@property (nonatomic, strong) NSMutableArray<PostDetail*> *postsDetails;
    
@end

@implementation PostsViewController

NSString *getPostsURL = @"http://jsonplaceholder.typicode.com/posts";
NSString *getPostDetailsURL = @"http://jsonplaceholder.typicode.com/users";
NSString *storedPostsKey = @"synopsisPosts";
NSString *storedPostsDetailsKey = @"synopsisPostsDetails";

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Posts";
    
    // Setup delegate and data source
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Remove all useless separators in table view
    self.tableView.tableFooterView = UIView.new;
    
    // Initialization
    self.posts = [NSMutableArray.alloc init];
    self.postsDetails = [NSMutableArray.alloc init];
    
    // If there are locally stored posts, show them
    NSArray *storedPosts = [NSUserDefaults.standardUserDefaults objectForKey:storedPostsKey];
    NSArray *storedPostsDetails = [NSUserDefaults.standardUserDefaults objectForKey:storedPostsDetailsKey];
    if (storedPosts && storedPostsDetails) {
        [self showPostsFromArray:storedPosts];
        [self storePostsDetailsFromArray:storedPostsDetails];
    } else {
        // Fetching posts from URL
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:getPostsURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nullable responseObject) {
            NSArray *responseObj = (NSArray *)responseObject;
            [self showPostsFromArray:responseObj];
            
            // Save Locally already fetched posts.
            [NSUserDefaults.standardUserDefaults setObject:responseObject forKey:storedPostsKey];
            
            // Fetching post details
            [manager GET:getPostDetailsURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nullable responseObject) {
                NSArray *responseObj = (NSArray *)responseObject;
                [self storePostsDetailsFromArray:responseObj];
                
                // Save Locally already fetched posts details.
                [NSUserDefaults.standardUserDefaults setObject:responseObject forKey:storedPostsDetailsKey];
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                NSLog(@"%@", error.description);
            }];
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"%@", error.description);
        }];
    }
}
    
#pragma mark - Helper Methods
- (void)showPostsFromArray:(NSArray *)posts {
    for (NSDictionary *dict in posts) {
        Post *post = [Post fromDictionary:dict];
        [self.posts addObject:post];
    }
    
    [self.tableView reloadData];
}
    
- (void)storePostsDetailsFromArray:(NSArray *)postsDetails {
    for (NSDictionary *dict in postsDetails) {
        PostDetail *postDetail = [PostDetail fromDictionary:dict];
        [self.postsDetails addObject:postDetail];
    }
}
    
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostsTableViewCell *cell = (PostsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(PostsTableViewCell.class)];
    cell.titleLabel.text = self.posts[indexPath.row].title;
    
    return cell;
}
    
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPostRow = indexPath.row;
    
    [self performSegueWithIdentifier:@"showDetailSegue" sender:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}
    
#pragma mark - Prepare for Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:DetailPostViewController.class]) {
        DetailPostViewController *detailPostVC = (DetailPostViewController *)segue.destinationViewController;
        if (self.postsDetails.count > self.selectedPostRow) {
            detailPostVC.author = self.postsDetails[self.selectedPostRow].name;
            detailPostVC.body = self.posts[self.selectedPostRow].body;
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning" message:@"No details exist for selected post!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertController addAction:alertActionOK];
            [self.navigationController presentViewController:alertController animated:YES completion:nil];
        }
    }
}

@end

