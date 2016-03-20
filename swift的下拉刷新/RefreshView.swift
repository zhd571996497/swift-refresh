//
//  RefreshView.swift
//  swift的下拉刷新
//
//  Created by 朱宏达 on 16/3/5.
//  Copyright © 2016年 朱宏达. All rights reserved.
//

import UIKit

private let kSceneHeight: CGFloat = 120.0

class RefreshView: UIView, UIScrollViewDelegate {
    
    private unowned var scrollView : UIScrollView//private相当于.m中的私有属性,unowned相当于oc中的weak,避免可能发生的内存泄露
    private var progress: CGFloat = 0.0
    
    init(frame: CGRect, scrollView : UIScrollView) {
        self.scrollView = scrollView
        super.init(frame : frame)
//        backgroundColor = UIColor.greenColor()
        updateBackgroundColor() 
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }//????
    
    func updateBackgroundColor() {
        backgroundColor = UIColor(white: 0.7 * progress + 0.2, alpha: 1.0)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // 1.先拿到刷新视图可见区域的高度
        let refreshViewVisibleHeight = max(0, -scrollView.contentOffset.y - scrollView.contentInset.top)
        
        // 2.计算当前滚动进度,范围0-1
        progress = min(1, refreshViewVisibleHeight / kSceneHeight)
        
        // 3.根据进度改变背景色
        updateBackgroundColor()
    }
}
