//
//  MarkdownCatalogItem.h
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#ifndef MarkdownCatalogItem_h
#define MarkdownCatalogItem_h

@interface MarkdownCatalogItem : NSObject

@property (nonatomic, assign) unsigned int catalogLevel;
@property (nonatomic, copy) NSString *catalogContent;
@property (nonatomic, copy) NSString *catalogLink;

- (void)description;

@end

#endif /* MarkdownCatalogItem_h */
