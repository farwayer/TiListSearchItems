#import <Foundation/Foundation.h>
#import "OrgFarwayerTiListsearchitemsModule.h"
#import "TiUIListSectionProxy.h"
#import "TiUIListViewProxy.h"

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
    TiUIListSectionProxy *section = args;

    return @([self itemCountInSection:section]);
}

- (id)listSearchCount:(id)args {
    ENSURE_SINGLE_ARG(args, TiUIListViewProxy);
    TiUIListViewProxy *list = args;

    int count = 0;
    for (TiUIListSectionProxy *section in list.sections) {
        count += [self itemCountInSection:section];
    }

    return @(count);
}

@end
