//
//  RefreshTableViewController.swift
//  swift的下拉刷新
//
//  Created by 朱宏达 on 16/3/5.
//  Copyright © 2016年 朱宏达. All rights reserved.
//

import UIKit

private let kRefreshViewHeight: CGFloat = 200

class RefreshTableViewController: UITableViewController {
    
    private var refreshView : RefreshView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshView = RefreshView(frame: CGRect(x: 0, y: -kRefreshViewHeight, width: CGRectGetWidth(view.bounds), height: kRefreshViewHeight), scrollView: tableView)
        
        view.insertSubview(refreshView, atIndex: 0)
        
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //我们要把这个通知传到refreshView
        refreshView.scrollViewDidScroll(scrollView)
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = "第 \(indexPath.row) 行"
        // Configure the cell...

        return cell
    }


}
