//
//  BaseVC.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//

import UIKit

class BaseVC <T : UIView> : UIViewController , StatusAPI {
    
    
    func showLoading() {
        Loader.instance.showLoading(view: mainView)
    }
    
    func hideLoading() {
        refreshController?.endRefreshing()
        Loader.instance.hideLoading()
    }
    
    var refreshController : UIRefreshControl?
    
    override func loadView() {
        let t  = T()
        t.backgroundColor = .white
        self.view = t
    }
    
    var mainView : T {
        if let view = self.view as? T {
            return view
        }else {
         let view = T()
         self.view = view
         return view
        }
    }
    

    
}
