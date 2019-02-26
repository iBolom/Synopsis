//
//  Post.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "Post.h"

@implementation Post
    
- (instancetype)initWithUserId:(NSInteger)userId
                           uid:(NSInteger)uid
                         title:(NSString *)title
                          body:(NSString *)body {
    if ((self = super.init)) {
        _userId = userId;
        _uid = uid;
        _title = title;
        _body = body;
    }
    
    return self;
}
    
+ (instancetype)fromDictionary:(NSDictionary *)dict {
    if (dict == nil) {
        return nil;
    }
    
    return [self.alloc initWithUserId:(NSInteger)dict[@"userId"]
                                  uid:(NSInteger)dict[@"id"]
                                title:dict[@"title"]
                                 body:dict[@"body"]];
}

@end
