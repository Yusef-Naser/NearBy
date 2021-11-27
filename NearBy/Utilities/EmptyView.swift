//
//  EmptyView.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import UIKit

class EmptyView : UIView {
    
    let iconEmpty : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        return l
    }()
    
    let labelEmpty : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 25)
        l.textAlignment = .center
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
        
        addSubview(iconEmpty)
        addSubview(labelEmpty)
        
        iconEmpty.anchor(centerX: centerXAnchor , centerY: centerYAnchor , paddingTop: 16 , width: 150, height: 150 )
        labelEmpty.anchor(top: iconEmpty.bottomAnchor , leading: leadingAnchor  , trailing: trailingAnchor , paddingTop: 16, paddingLeft: 16 , paddingBottom: 16 , paddingRight: 16 )
        
    }
    
    
    static func setNoDataFound () -> EmptyView {
        let v = EmptyView()
        v.iconEmpty.image = #imageLiteral(resourceName: "kevin-wolf-AoedMta7hxY-unsplash (1)")
        v.labelEmpty.text = "No Data Found !!"
        return v
    }
    
    
    static func setSomethingWrong() -> EmptyView {
        let v = EmptyView()
        v.iconEmpty.image = #imageLiteral(resourceName: "zhu-hongzhi-eT_rrCbvcqg-unsplash (1)")
        v.labelEmpty.text = "Something Went Wrong !!"
        return v
    }
    
}
