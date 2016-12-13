//
//  main.c
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkdownCatalogList.h"
#import "MarkdownFileReader.h"
#import "MarkdownCatalogBuilder.h"
#import "MarkdownCatalogOutput.h"

int main(int argc, const char * argv[]) {
    
    MarkdownFileReader *fr = [MarkdownFileReader new];
    MarkdownCatalogList *list = [fr readFile];
    [MarkdownCatalogBuilder scanCatalogList:list];
    [fr writeFile:[MarkdownCatalogOutput output:list]];
    return 0;
}
