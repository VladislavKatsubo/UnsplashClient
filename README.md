
# Unsplash Client

I found and completed a test assignment.

The task was to create a client application for the Unsplash API.

* The start screen is a tabbar with two tabs. The first tab is a collection of random photos from Unsplash. At the top is a search bar for photos from Unsplash. Clicking on a cell takes the user to a detailed information screen.
* On the second tab is a table with a list of favorite photos. The cell contains a thumbnail of the photo and the name of the author. Clicking on the cell takes you to the detailed information screen.
* The details screen contains the photo, author name, creation date, location and number of downloads.
* The screen also contains a button that you can click to add a photo to or remove from your list of favorite photos. You can make this list editable if you wish.


1. Do all the layout of the app in code, no xib and storyboard. Done!
2. Don't use SnapKit, you should use Auto Layout only. Done!
3. Don't use SwiftUI. Done!
4. Use at least one third-party library Cocoa Pods (except Unsplash Photo Picker for iOS and other similar libraries to work with Unsplash). I've decided to use Realm but it wasn't injected using Cocoa Pods but SwiftPackage manager.
5. There should be at least one alert. Done!
6. The task should take up to 16 hours (2 working days)
It took me 24 working hours to do this.
The biggest problem was Realm issue. I've spent 6 hours to find a way to use PhotoModel class both for storing parsed JSON objects and for Realm objects to save it into DB.

I've used this project as an educational. I've tested a lot of different thing here to challenge myself.
Architecture - MVC

Here is the results:

![simulator](https://user-images.githubusercontent.com/111345842/198193742-06fc9037-5f3c-4251-b600-15cf9080b630.gif)



It's not the best code there but i'm proud of this anyway :)
