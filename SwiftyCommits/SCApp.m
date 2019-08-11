//
//  SCApp.m
//  SwiftyCommits
//
//  Created by iosdev on 7/16/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

#import "SCApp.h"

@implementation SCApp

-(void)fetchCommitsForRepo:(NSString *)repo{
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/commits", repo];
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url
                                         options:NSDataReadingUncached error:&error];
    if (error != nil){
        NSLog(@"Error 1 %@", [error userInfo]);
        exit(0);
    }
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
    if (error != nil){
        NSLog(@"Error 2 %@", [error userInfo]);
        exit(0);
    }
    
    for (NSDictionary *object in json) {
        NSString *name = object[@"commit"][@"author"][@"name"] ?: @"Anonymous";
        NSString *message = object[@"commit"][@"message"];
        
        message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        printf("%s: %s\n\n", [name cStringUsingEncoding:NSUTF8StringEncoding], [message cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

-(void)fetchCommitsForRepoWithAuthor:(NSString*)repo author:(NSString*)author{
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/commits?author=%@", repo, author];
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url
                                         options:NSDataReadingUncached error:&error];
    if (error != nil){
        NSLog(@"Error 1 %@", [error userInfo]);
        exit(0);
    }
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
    if (error != nil){
        NSLog(@"Error 2 %@", [error userInfo]);
        exit(0);
    }
    
    for (NSDictionary *object in json) {
        NSString *name = object[@"commit"][@"author"][@"name"] ?: @"Anonymous";
        NSString *message = object[@"commit"][@"message"];
        
        message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        printf("%s: %s\n\n", [name cStringUsingEncoding:NSUTF8StringEncoding], [message cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}
@end
