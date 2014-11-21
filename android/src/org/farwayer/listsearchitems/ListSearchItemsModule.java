package org.farwayer.listsearchitems;

import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;
import ti.modules.titanium.ui.widget.listview.ListSectionProxy;
import ti.modules.titanium.ui.widget.listview.ListViewProxy;

@SuppressWarnings("unused")
@Kroll.module(name = "ListSearchItems", id = "org.farwayer.listsearchitems")
public class ListSearchItemsModule extends KrollModule {
    @Kroll.method
    public int sectionSearchCount(ListSectionProxy section) {
        if (section.getListView() == null)
            return 0;
        return section.getContentCount();
    }

    @Kroll.method
    public int listSearchCount(ListViewProxy list) {
        ListSectionProxy[] sections = list.getSections();

        int count = 0;
        for (ListSectionProxy section : sections) {
            count += sectionSearchCount(section);
        }

        return count;
    }
}