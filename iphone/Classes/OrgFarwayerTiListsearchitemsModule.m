#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
#import "OrgFarwayerTiListsearchitemsModule.h"
#import "TiUIListSectionProxy.h"
#import "TiUIListViewProxy.h"
#import "TiUIListView.h"

@implementation OrgFarwayerTiListsearchitemsModule

#pragma mark Internal

- (id)moduleGUID {
    return @"6145be56-afad-4dc9-a118-3b1d4474c996";
}

- (NSString *)moduleId {
    return @"org.farwayer.ti.listsearchitems";
}

-(int)itemCountInSection:(TiUIListSectionProxy*)section {
    return section.itemCount;
}

#pragma Public APIs

- (id)sectionSearchCount:(id)args {
    ENSURE_SINGLE_ARG(args, TiUIListSectionProxy);
    TiUIListSectionProxy *sectionProxy = args;

    TiUIListView *list = (id) sectionProxy.delegate;
    UITableView *table = list.tableView;
    id <UITableViewDataSource> source = (id<UITableViewDataSource>) list;
    int index = sectionProxy.sectionIndex;

    int count = [source tableView:table numberOfRowsInSection:index];

    return @(count);
}

- (id)listSearchCount:(id)args {
    ENSURE_SINGLE_ARG(args, TiUIListViewProxy);
    TiUIListViewProxy *listProxy = args;

    TiUIListView *list = (TiUIListView *) listProxy.view;
    UITableView *table = list.tableView;
    id <UITableViewDataSource> source = (id<UITableViewDataSource>) list;
    int sectionCount = [source numberOfSectionsInTableView:table];

    int count = 0;
    for (int i = 0; i < sectionCount; i++) {
        count += [source tableView:table numberOfRowsInSection:i];
    }

    return @(count);
}

@end
