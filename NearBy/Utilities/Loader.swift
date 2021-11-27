//
//  Loader.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import UIKit

class Loader : UIView {
    
    static var instance : Loader = Loader()
    
    private init() {
        super.init(frame: .zero)
        initViews()
    }
    
    private let indicator : UIActivityIndicatorView = {
        let l = UIActivityIndicatorView()
        l.style = .large
        return l
    }()
    
    private let label : UILabel = {
        let l = UILabel()
        l.text = "Please wait..."
        l.textColor = .black
        return l
    }()
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
        self.backgroundColor = .white
    }
    
    private func addViews () {
        
        self.addSubview(indicator)
        self.addSubview(label)
        
        indicator.anchor( top: topAnchor , centerX: centerXAnchor  , paddingTop: 16  )
        label.anchor(top: indicator.bottomAnchor , leading: leadingAnchor , bottom: bottomAnchor , trailing: trailingAnchor , centerX: centerXAnchor , paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16 )
        
    }
    
    func showLoading (view : UIView) {
        view.addSubview(self)
        self.anchor( centerX: view.centerXAnchor , centerY: view.centerYAnchor )
        indicator.startAnimating()
    }
    
    func hideLoading () {
        indicator.stopAnimating()
        self.removeFromSuperview()
    }
    
}
