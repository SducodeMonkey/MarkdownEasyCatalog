//
//  MarkdownFileReader.m
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkdownFileReader.h"
#import "MarkdownCatalogList.h"
#import "MarkdownCatalogItem.h"

@interface MarkdownFileReader ()

@property (nonatomic, strong) NSFileManager *fm;

@end

@implementation MarkdownFileReader

- (instancetype)init {
    if (self = [super init]) {
        self.fm = [[NSFileManager alloc] init];
    }
    return self;
}

- (MarkdownCatalogList *)readFile {
    NSString *currentDir;
    NSArray *dirFileArr;
    NSString *filePath;
    NSString *fileContent;
    NSArray *allLines;
    MarkdownCatalogList *list;
    currentDir = self.fm.currentDirectoryPath;
    NSLog(@"Current directory: %@.", currentDir);
    dirFileArr = [self.fm contentsOfDirectoryAtPath:currentDir error:nil];
    for (NSString *fileName in dirFileArr) {
        if ([fileName hasSuffix:@".md"]) {
            filePath = [currentDir stringByAppendingPathComponent:fileName];
            NSLog(@"Find a markdown file, full path is: %@.", filePath);
            break;
        }
    }
    if (!filePath) {
        NSLog(@"No valid markdown found in current directory, return.");
        return nil;
    }
    fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (fileContent) {
        NSLog(@"Read file content: %@", fileContent);
    } else {
        return nil;
    }
    
    allLines = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    if (allLines && allLines.count > 0) {
        list = [MarkdownCatalogList new];
        for (int i = 0; i < allLines.count; i++) {
            NSString *line = [allLines objectAtIndex:i];
            NSLog(@"[line %d]: %@", i + 1, line);
            MarkdownCatalogItem *item = [MarkdownCatalogItem new];
            if ([line hasPrefix:@"######"]) {
                item.catalogContent = [line substringFromIndex:7];
                item.catalogLevel = 6;
            } else if ([line hasPrefix:@"#####"]) {
                item.catalogContent = [line substringFromIndex:6];
                item.catalogLevel = 5;
            } else if ([line hasPrefix:@"####"]) {
                item.catalogContent = [line substringFromIndex:5];
                item.catalogLevel = 4;
            } else if ([line hasPrefix:@"###"]) {
                item.catalogContent = [line substringFromIndex:4];
                item.catalogLevel = 3;
            } else if ([line hasPrefix:@"##"]) {
                item.catalogContent = [line substringFromIndex:3];
                item.catalogLevel = 2;
            } else if ([line hasPrefix:@"#"]) {
                item.catalogContent = [line substringFromIndex:2];
                item.catalogLevel = 1;
            }
            if (item.catalogLevel != 0) {
                [item description];
                [list addCatalogItem:item];
            }
        }
    }
    return list;
}

- (void)writeFile:(NSString *)output {
    NSString *currentDir = [self.fm currentDirectoryPath];
    NSString *outputFilePath = [currentDir stringByAppendingPathComponent:@"output"];
    if ([self.fm fileExistsAtPath:outputFilePath]) {
        [self.fm removeItemAtPath:outputFilePath error:nil];
    }
    [output writeToFile:outputFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
