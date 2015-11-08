[![Build Status](https://travis-ci.org/rob-nash/RRNCollapsableSectionTableView.svg?branch=master)](https://travis-ci.org/rob-nash/RRNCollapsableSectionTableView)

![](http://i.imgur.com/jDq37Ip.gif?1)
![](http://i.imgur.com/77YQhPE.gif?1)

## Requirements
XCode 6.4+, iOS 8.1+

## Installation
In XCode, select 'Add Files To Project', and select the following
* RRNCollapsableSectionHeaderProtocol.h
* RRNCollapsableSectionHeaderReactiveProtocol.h
* RRNCollapsableSectionItemProtocol.h
* RRNCollapsableSectionTableViewController.h
* RRNCollapsableSectionTableViewController.m

## Usage
1. Build a UITableView, either in code or from interface builder.
2. Subclass UITableViewHeaderFooterView and conform to the RRNCollapsableSectionHeader Protocol. Create a nib for this subclass.
3. Subclass RRNCollapsableTableViewController and do the following inside your subclass:
	* override 'collapsableTableView' and return your table view
	* override 'model' and return a pointer to an array of objects, which conform to RRNCollapsableSectionItem Protocol.
	* override 'sectionHeaderNibName' and return the filename of the nib you created in step 2.

See the 'Example' project for a demonstration.

## Protocol Descriptions

RRNCollapsableSectionHeaderProtocol states the following:
* It must be possible to reference a label that has a title for the section
* It must be possible to reference a delegate that conforms to the RRNCollapsableSectionHeaderReactiveProtocol; to relay user interaction
* It must be possible to assign the instance to an 'opened' state, specifying wether an animation is permitted, or not.
* It must be possible to assign the instance to a 'closed' state, specifying wether an animation is permitted, or not.

RRNCollapsableSectionHeaderReactiveProtocol states the following:
* It must be possible to handle user interaction of a given view.

RRNCollapsableSectionItemProtocol states the following:
* A title must be provided.
* A boolean indication that the section should be visible, or not.
* A collection of items, representing each row in a given section, should be provided.

## License
RRNCollapsableSectionTableViewController is released under the MIT license. See 'Licence.md' for details.