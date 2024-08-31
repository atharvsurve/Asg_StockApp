# internship_asg
StockList : 
The main feature of the Stockslist widget is to read data from a JSON file and display it using a ListView.builder. It shows a list of stocks where each item displays:
The name of the stock
Its amount
Intra-day performance (highlighted in green or red)
A description of the stock
The percentage change of the stock
Features
Automatic Loading of JSON Data: The app automatically reads stock data from a db.json file upon initialization.
Dynamic Data Handling: The app dynamically populates the UI based on the data provided in the JSON file.
Formatted Stock Data: Each stock entry is formatted with color-coded intra-day performance (green for positive, red for negative). A function to check positive or negative values is made for giving the color to the value of a stock .
readJson Function
This function reads the data from the JSON file located at lib/jsonFile/db.json. The data is stored in the _items list, which is then used to populate the ListView.

Navigation:
The app uses a Scaffold widget, which provides the structure for the layout. The body of the Scaffold contains an IndexedStack, and the bottom of the screen is populated with a BottomNavigationBar.
IndexedStack: This widget allows switching between different widgets (or pages) based on the index. It ensures that only the widget corresponding to the current index is visible, but all widgets remain in memory and retain their state. 
widgetList: This is a list of widgets that represent the different screens in the app. Each item in the list is a different screen or widget that is displayed when its corresponding index is selected.
BottomNavigationBar: This widget provides the navigation bar at the bottom of the screen. It contains several items, each representing a different screen the user can navigate to.
currentIndex: myIndex: This property tracks the currently selected item. It ensures the correct navigation item is highlighted based on the current screen.
onTap: (index): When the user taps an item in the navigation bar, this callback is triggered. It updates the myIndex to the selected index, which in turn updates the visible screen in the IndexedStack.
selectedItemColor and unselectedItemColor: These properties control the color of the navigation icons and labels. The selected item is fully opaque, while the unselected items are partially transparent.
selectedLabelStyle and unselectedLabelStyle: These define the font size and weight for the labels under the navigation icons.
