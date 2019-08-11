//
//  SCApp.h
//  SwiftyCommits
//
//  Created by iosdev on 7/16/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject
-(void)fetchCommitsForRepo:(NSString*)repo;
-(void)fetchCommitsForRepoWithAuthor:(NSString*)repo author:(NSString*)author;
@end

NS_ASSUME_NONNULL_END
