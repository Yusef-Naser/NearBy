//
//  NearByView.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//VC

import UIKit


class NearByView : UIView {
    
    
    let tableView : UITableView = {
        let l = UITableView()
        l.tableFooterView = UIView()
        l.register(CellNearBy.self , forCellReuseIdentifier: CellNearBy.getIdentifier())
        return l
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
    }
    
    private func addViews () {
        
        addSubview(tableView)
        tableView.anchor(top: topAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor )

    }
    
    
}
