//
//  LocationManager.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import CoreLocation
import UIKit

class LocationManager : NSObject {
    
    static var instance = LocationManager()
    
    private let locationManager = CLLocationManager()
    private var lastLocation : CLLocation? = nil
    
    var completionGetLastPlaces : ( (_ lat : Double,_ lng : Double)->Void )?
    
    var singleMode = true
    
    private override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation (vc : UIViewController) {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            return
        case .restricted:
            alertRequestAuthLocation(vc: vc )
            return
        case .denied:
            alertRequestAuthLocation(vc: vc )
            return
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            return
        case .authorizedWhenInUse:
            locationManager.stopUpdatingLocation()
            return
        @unknown default:
            return
        }
    }
    
    func startUpdatingLocation () {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation () {
        locationManager.stopUpdatingLocation()
    }
    
    func alertRequestAuthLocation (vc : UIViewController){
        let alert = UIAlertController(title: nil , message: "Please enable location for app" , preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK" , style: .default) { (_) in
            if let url = URL.init(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancel = UIAlertAction(title: "Cancel" , style: .cancel , handler: nil )
        alert.addAction(ok)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
    }
    

}

extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
      
    }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if singleMode {
            if lastLocation == nil {
                lastLocation = locations.first
                completionGetLastPlaces?(locations.first?.coordinate.latitude ?? 0 , locations.first?.coordinate.longitude ?? 0)
            }else {
                lastLocation = locations.first
            }
            return
        }
        guard let l = lastLocation else {
            lastLocation = locations.first
            completionGetLastPlaces?(locations.first?.coordinate.latitude ?? 0 , locations.first?.coordinate.longitude ?? 0)
            return
        }
        

      if let location = locations.first  {
        let distance = location.distance(from: l)
        if distance >= 500 {
            lastLocation = locations.first
            completionGetLastPlaces?(location.coordinate.latitude , location.coordinate.longitude)
        }
      }
      
  }
    
}
