Collapsable Options
===================
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic&label=Legal)](https://raw.githubusercontent.com/rob-nash/InfiniteScroll/master/Licence.md)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-Greene.svg?style=plastic)](https://github.com/Carthage/Carthage)

##Description

<sup>XCode 6.4+ iOS 8.0+</sup>

Example implementations of [CollapsableTableKit](https://github.com/rob-nash/CollapsableTableKit.git). As you can see, I'm not a designer. If anyone would like to send me a design, I will implement it!

![](http://i.imgur.com/QfLjuZc.gif?1)
![](http://i.imgur.com/0Uk9ACL.gif?1)
![](http://i.imgur.com/ECWZHTt.gif?1)

##Demo
Try the variety of examples in the Demo App. Switch between the examples by switching schemes.

## Dependencies

* [CollapsableTableKit](https://github.com/rob-nash/CollapsableTableKit.git)

## Installation with Carthage
Add the following to your Cartfile.

* github "https://github.com/rob-nash/CollapsableOptions" >= 1.0.0

After running Carthage, add each of the following frameworks to your project, as embedded frameworks. See [Carthage](https://github.com/Carthage/Carthage) for details.

* CollapsableOptions.framework
* CollapsableTableKit.framework

You may need to add a framework search path to your build settings that points at the carthage build folder.

## Implementation
1. Build a UITableView, either in code or from interface builder.
2. Subclass UITableViewHeaderFooterView and conform to the RRNCollapsableSectionHeader Protocol. Create a nib for this subclass.
3. Subclass RRNCollapsableTableViewController and do the following inside your subclass:
	* override 'collapsableTableView' and return your table view
	* override 'model' and return a pointer to an array of objects, which conform to RRNCollapsableSectionItem Protocol.
	* override 'sectionHeaderNibName' and return the filename of the nib you created in step 2.

## Known issues
If you have > 8,000-10,000 rows in any given table view section, the framerate drops to a noticable level.
