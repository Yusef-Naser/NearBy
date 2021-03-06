//
//  Utilities.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil , leading: NSLayoutXAxisAnchor? = nil , bottom: NSLayoutYAxisAnchor? = nil , trailing: NSLayoutXAxisAnchor? = nil , centerX:NSLayoutXAxisAnchor? = nil ,centerY: NSLayoutYAxisAnchor? = nil ,paddingTop: CGFloat = 0 ,paddingLeft: CGFloat = 0 ,paddingBottom: CGFloat = 0 ,paddingRight: CGFloat = 0 , width: CGFloat = 0 ,height: CGFloat = 0 ,paddingCenterX: CGFloat = 0 ,paddingCenterY: CGFloat = 0) {
           translatesAutoresizingMaskIntoConstraints = false
           
           if let top = top {
               topAnchor.constraint(equalTo: top, constant:paddingTop).isActive = true
           }
           
           if let left = leading {
               leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
           }
           
           if let bottom = bottom {
               bottomAnchor.constraint(equalTo: bottom, constant:-paddingBottom).isActive = true
           }
           
           if let right = trailing {
               trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
           }
           
           if width != 0 {
               widthAnchor.constraint(equalToConstant: width).isActive = true
           }
           
           if height != 0 {
               heightAnchor.constraint(equalToConstant: height).isActive = true
           }
           if let centerX = centerX {
               centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
           }
           if let centerY = centerY {
               centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
           }
       }
    
}

extension UITableViewCell {
    static func getIdentifier () -> String  {
        return String(describing: self)
    }
    
}


extension UIScrollView {
    func addRefreshController() -> UIRefreshControl {
        let r = UIRefreshControl()
        self.refreshControl = r
        self.addSubview(r)
        return r
    }
}

var imageCashes = NSCache<AnyObject , AnyObject>()

extension UIImageView {
    
    func imageFromServerURL(urlString: String) {
        if let image = imageCashes.object(forKey: urlString as NSString) {
            self.image = image as? UIImage
            return
        }
        let session = URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                if error != nil {
                    return
                }
                if let data = data , let image = UIImage(data: data) {
                    imageCashes.setObject(image , forKey: urlString as NSString)
                    self.image = image
                }
                    
            })
                
        })
        session.resume()
        //return session
           
    }
    
}


extension Date {
    
    func getDateWithFormatePlace () -> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyyMMdd"
        return formater.string(from: self)
    }
    
}
