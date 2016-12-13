//
//  MarkdownCatalogList.m
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkdownCatalogList.h"

@interface MarkdownCatalogList ()

@property (nonatomic, strong) NSMutableArray *catalogList;
@property (nonatomic, assign) unsigned int index;

@end

@implementation MarkdownCatalogList

- (instancetype)init {
    if (self = [super init]) {
        self.catalogList = [NSMutableArray array];
        self.index = 0;
    }
    return self;
}

- (void)addCatalogItem:(MarkdownCatalogItem *)item {
    if (item) {
        [self.catalogList addObject:item];
    }
}

- (MarkdownCatalogItem *)getNextItem {
    if (self.index < self.catalogList.count) {
        self.index++;
        return [self.catalogList objectAtIndex:self.index - 1];
    }
    return nil;
}

- (void)clearIndex {
    self.index = 0;
}

- (int)getMinLevel {
    int min = 10;
    for (MarkdownCatalogItem *item in self.catalogList) {
        if (item.catalogLevel < min) {
            min = item.catalogLevel;
        }
    }
    return min;
}

@end
