var ListSearchItems = require('org.farwayer.listsearchitems');

var win = Ti.UI.createWindow();

var search = Titanium.UI.createSearchBar({
    barColor:'#000',
    showCancel:true,
    height:43,
    top:0
});

var listView = Ti.UI.createListView({searchView: search, caseInsensitiveSearch: true});
var section = Ti.UI.createListSection();
var fruits = ['Papaya', 'Peach', 'Pear', 'Persimmon', 'Pineapple', 'Pluot', 'Pomegranate'];
var data = [];
for (var i = 0; i < fruits.length; i++) {
    data.push({
        properties: {title: fruits[i], searchableText: fruits[i]}
    });
}
section.setItems(data);
listView.sections = [section];

win.add(listView);
win.open();

search.addEventListener('change', function () {
    Ti.API.info(ListSearchItems.listSearchCount(listView));
});