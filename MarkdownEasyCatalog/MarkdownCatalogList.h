//
//  MarkdownCatalogList.h
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#ifndef MarkdownCatalogList_h
#define MarkdownCatalogList_h

#import "MarkdownCatalogItem.h"

@interface MarkdownCatalogList : NSObject

- (void)addCatalogItem:(MarkdownCatalogItem *)item;
- (MarkdownCatalogItem *)getNextItem;
- (void)clearIndex;
- (int)getMinLevel;

@end

#endif /* MarkdownCatalogList_h */
