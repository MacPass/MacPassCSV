//
//  MPCSVPlugin.m
//  MacPassCSV
//
//  Created by Michael Starke on 26.08.19.
//  Copyright © 2019 HicknHack Software GmbH. All rights reserved.
//

#import "MPCSVPlugin.h"
#import "MPCSVWriter.h"
#import <KeePassKit/KeePassKit.h>

@implementation MPCSVPlugin
  
- (void)prepareImportMenuItem:(nonnull NSMenuItem *)item {
  item.title = NSLocalizedString(@"CSV…", "Import Menu Item");
}
  
- (void)prepareOpenPanel:(nonnull NSOpenPanel *)panel {
  panel.allowsMultipleSelection = NO;
  panel.canChooseDirectories = NO;
  panel.canChooseFiles = YES;
  panel.allowedFileTypes = @[ @"csv" ];
}
  
- (nullable KPKTree *)treeForRunningOpenPanel:(nonnull NSOpenPanel *)panel {
  return nil;
}

- (void)exportTree:(KPKTree *)tree forRunningSavePanel:(NSSavePanel *)panel {
  /*
   Show UI
   Write Files
   */
  
  NSArray *columns = @[ @"Group", @"Title", @"Username", @"Password", @"Url", @"Notes" ];
  
  MPCSVWriter *writer = [[MPCSVWriter alloc] initWithColumnNames:columns];
  
  for(KPKEntry *entry in tree.allEntries) {
    
    NSArray *entryRow = @[ [entry.parent breadcrumbWithSeparator:@"/"],
                           entry.title,
                           entry.username,
                           entry.password,
                           entry.url,
                           entry.notes ];
    
    [writer addRow:entryRow];
  }
  
  NSError *error;
  BOOL success = [writer writeToURL:panel.URL error:&error];
  return;
}

- (void)prepareExportMenuItem:(nonnull NSMenuItem *)item {
  item.title = NSLocalizedString(@"CSV…", "Export CSV Menu Item");
}

- (void)prepareSavePanel:(nonnull NSSavePanel *)panel {
  panel.allowedFileTypes = @[ @"csv"];
}

@end
