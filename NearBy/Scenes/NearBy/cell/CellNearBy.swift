//
//  CellNearBy.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import UIKit

protocol CellNearByConfiguration {
    func setImagePlace (image : String?)
    func setPlaceName (name : String?)
    func setPlaceAddress (address : String? )
}

class CellNearBy : UITableViewCell {
    
    private let imagePlace : UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.clipsToBounds = true
        l.image = #imageLiteral(resourceName: "placeholder")
        return l
    }()
    
    private let labelPlaceName : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    
    private let labelAddress : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15)
        l.textColor = .gray
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    private func initViews () {
        addViews()
        self.selectionStyle = .none
    }
    
    private func addViews () {
        
        contentView.addSubview(imagePlace)
        contentView.addSubview(labelPlaceName)
        contentView.addSubview(labelAddress)
        
        imagePlace.anchor(top: contentView.topAnchor , leading: contentView.leadingAnchor , bottom: contentView.bottomAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , width: 70 , height: 70 )
        
        labelPlaceName.anchor(top: contentView.topAnchor , leading: imagePlace.trailingAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8 , paddingRight: 8 )
        labelAddress.anchor(top: labelPlaceName.bottomAnchor , leading: imagePlace.trailingAnchor , bottom: contentView.bottomAnchor , trailing: contentView.trailingAnchor , paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        
    }
    
}


extension CellNearBy : CellNearByConfiguration {
    
    func setImagePlace(image: String?) {
        imagePlace.imageFromServerURL(urlString: image ?? "" )
    }
    
    func setPlaceName(name: String?) {
        labelPlaceName.text = name
    }
    
    func setPlaceAddress(address: String?) {
        labelAddress.text = address
    }
    
}
