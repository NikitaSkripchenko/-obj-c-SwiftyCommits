//
//  main.m
//  SwiftyCommits
//
//  Created by iosdev on 7/16/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCApp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *repo = @"apple/swift";
        NSString *author = @"slavapestov";
        if (argc == 2){
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
            
        }
        SCApp *app = [SCApp new];
        [app fetchCommitsForRepo:repo];
        [app fetchCommitsForRepoWithAuthor:repo author:author];
    }
    return 0;
}
