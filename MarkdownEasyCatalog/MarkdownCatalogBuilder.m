//
//  MarkdownCatalogBuilder.m
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkdownCatalogBuilder.h"
#import "MarkdownCatalogItem.h"

@implementation MarkdownCatalogBuilder

+ (void)scanCatalogList:(MarkdownCatalogList *)list {
    if (!list) {
        return;
    }
    MarkdownCatalogItem *item;
    NSString *content;
    NSMutableString *linkdStr;
    NSMutableDictionary *alreadyResolveDic = [NSMutableDictionary dictionary];
    while ((item = [list getNextItem])) {
        content = item.catalogContent;
        linkdStr = [NSMutableString stringWithString:[content lowercaseString]];
        // 去除`.`
        // 替换` `为`-`
        NSString *tmp = [linkdStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
        tmp = [tmp stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        
        NSArray *keys = [alreadyResolveDic allKeys];
        if ([keys containsObject:content]) {
            NSNumber *resolveCount = [alreadyResolveDic objectForKey:content];
            [alreadyResolveDic setObject:[NSNumber numberWithLong:[resolveCount intValue] + 1] forKey:content];
            [linkdStr appendFormat:@"-%d", [resolveCount intValue]];
        } else {
            [alreadyResolveDic setObject:[NSNumber numberWithLong:1] forKey:content];
        }
        NSString *finalLinkedStr = [NSString stringWithFormat:@"#%@", linkdStr];
        item.catalogLink = finalLinkedStr;
    }
    [list clearIndex];
    
    while ((item = [list getNextItem])) {
        [item description];
    }
}

@end
