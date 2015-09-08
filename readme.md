## Installation

Drag each file prefixed with 'RRN', into your project.

## Requirements

XCode 5+, iOS 6+

## Usage

Build a UITableView, either in code or from interface builder.
Build a section header by subclassing UITableViewHeaderFooterView. Your section header must conform to the RRNCollapsableSectionHeader Protocol

Subclass RRNCollapsableTableViewController and do the following inside your subclass:

	- Register your section header view with your table view
	- override 'collapsableTableView' and return your table view
	- override 'model' and return an array of objects that confrom to RRNCollapsableSectionItemProtocol. Make sure this array is assembled once only.
	- override 'sectionHeaderReuseIdentifier' and return a reuse idnetifier for your registered section header view.
	- override 'heightForRowAtIndexPath' and return a value.
	- override 'heightForHeaderInSection' and return a value.
	- override 'cellForRowAtIndexPath' and return a cell;

See the example project for details.

## License

RRNCollapsableSectionTableViewController is released under the MIT license. See LICENSE for details.