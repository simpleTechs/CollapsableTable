[![Build Status](https://travis-ci.org/rob-nash/RRNCollapsableSectionTableView.svg?branch=master)](https://travis-ci.org/rob-nash/RRNCollapsableSectionTableView)

![](http://i.imgur.com/jDq37Ip.gif?1)
![](http://i.imgur.com/77YQhPE.gif?1)

## Installation

Drag each file prefixed with 'RRN', into your project.

## Requirements

XCode 6.4+, iOS 8.1

## Usage

1. Build a UITableView, either in code or from interface builder.
2. Build a section header by subclassing UITableViewHeaderFooterView. Your section header must conform to the RRNCollapsableSectionHeader Protocol
3. Subclass RRNCollapsableTableViewController and do the following inside your subclass:
	* override 'collapsableTableView' and return your table view
	* override 'model' and return an array of objects, each of which conforms to RRNCollapsableSectionItemProtocol. Make sure this array is assembled once only.
	* override 'sectionHeaderNibName' and return the filename of your nib file that your using.

See the 'Example' project for a demonstration.

## License

RRNCollapsableSectionTableViewController is released under the MIT license. See 'Licence.md' for details.