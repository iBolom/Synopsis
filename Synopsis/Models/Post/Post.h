//
//  Post.h
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject
    
@property NSInteger userId;
@property NSInteger uid; //unique id
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
    
- (instancetype)initWithUserId:(NSInteger)userId
                           uid:(NSInteger)uid
                         title:(NSString *)title
                          body:(NSString *)body;
+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
