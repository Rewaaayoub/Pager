//
//  ViewController.swift
//  Segements
//
//  Created by Rewaa Ayoub on 9/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ViewController: ButtonBarPagerTabStripViewController {
    var isReload = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonBarView.selectedBar.backgroundColor = .orange
        buttonBarView.backgroundColor = .white
       
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
       
             let child_2 = FirstViewController(itemInfo: "View")
  
             let child_4 = ScondViewController(itemInfo: "View 2")
          
             let child_6 = FirstViewController(itemInfo: "View 3")
         
             let child_8 = ScondViewController(itemInfo: "View 4")

           guard isReload else {
                      return [ child_2, child_4,  child_6,  child_8]
                  }

             var childViewControllers = [child_2,  child_4,child_6, child_8]

             for index in childViewControllers.indices {
                 let nElements = childViewControllers.count - index
                 let n = (Int(arc4random()) % nElements) + index
                 if n != index {
                     childViewControllers.swapAt(index, n)
                 }
             }
             let nItems = 1 + (arc4random() % 8)
             return Array(childViewControllers.prefix(Int(nItems)))
    }
    override func reloadPagerTabStripView() {
          isReload = true
           if arc4random() % 2 == 0 {
               pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0, elasticIndicatorLimit: arc4random() % 2 == 0 )
           } else {
               pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
           }
           super.reloadPagerTabStripView()
       }
}

