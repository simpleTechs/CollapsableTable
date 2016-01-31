/**
 *  CollapsableTable - Collapsable table view sections with custom section header views.
 *
 *  RRNCollapsableTableViewController.h
 *
 *  For usage, see documentation of the classes/symbols listed in this file.
 *
 *  Copyright (c) 2016 Rob Nash. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

#import "RRNCollapsableTableViewSectionHeaderProtocol.h"
#import "RRNCollapsableTableViewSectionModelProtocol.h"

@interface RRNCollapsableTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

/*!
 * @discussion Override this method to return a custom table view.
 * @return the table view. Is nil unless overriden.
 */
-(UITableView *)collapsableTableView;

/*!
 * @discussion Override this method to return a custom model for the table view.
 * @return the model for the table view. Is nil unless overriden.
 */
-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)model;

/*!
 * @discussion Override this method to return the nib name of your UITableViewHeaderFooterView subclass.
 * @return the section header nib name. Is nil unless overriden.
 */
-(NSString *)sectionHeaderNibName;

/*!
 * @discussion Only one section is visible when the user taps to select a section. Deselecting an open section, closes all sections. By returning 'NO' for this value, then this rule is ignored.
 * @return a boolean indication for conforming to the single open selection rule. Is 'NO' by defualt.
 */
-(BOOL)singleOpenSelectionOnly;

@end
