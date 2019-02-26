# Synopsis

Supports: iOS 10.x and above

## Dependencies:

The project is using cocoapods for managing external libraries.

Get Cocoa Pods

```
sudo gem install cocoapods
```

Then install the pods

```
pod install
```

### Core Dependencies

* AFNetworking - A tool for working with network requests.

## Project structure:

* SupportingFiles - Assets, LaunchScreen.storyboard, Info.plist.
* Models - All model objects in project.
* Cells - All table view or collection view cells in project.
* View Controllers - All View controllers in project.


## TODO:
* Instead of using NSUserDefaults for storing persistent data(Posts, PostDetails) we can use also Core Data or Realm to work with concrete objects. For now NSUserDefaults is working for this situation but this should be refactored since NSUserDefaults are using only for storing small chunks of data.
(Didn't have time to finish it in 2-3 hours so i chose NSUserDefaults).
