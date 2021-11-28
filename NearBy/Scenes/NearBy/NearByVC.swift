//
//  NearByVC.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//

import UIKit

class NearByVC : BaseVC<NearByView> {
    
    private var presenter : ProNearByPresetner?
    
    private let locationManager = LocationManager.instance
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationItem.title = "Bear By"
        let buttonItem = UIBarButtonItem(title: "RealTime", style: .plain , target: self, action: #selector(actionRealTime(_ :)) )
        navigationItem.rightBarButtonItem = buttonItem
        
        presenter = NearByPresenter(view : self )
        
        locationManager.requestLocation(vc: self)
        
        locationManager.completionGetLastPlaces = { [weak self] lat , lng in
            self?.presenter?.getNearByPlaces(lat: lat , lng: lng )
        }
        
        refreshController = mainView.tableView.addRefreshController()
        refreshController?.addTarget(self , action: #selector(refreshPlaces), for: .valueChanged)
        
    }
    
    @objc private func actionRealTime (_ button : UIBarButtonItem) {
        if button.title == "RealTime" {
            locationManager.singleMode = false
            button.title = "Single Update"
            
            locationManager.requestLocation(vc: self )
            locationManager.startUpdatingLocation()
        }else if button.title == "Single Update" {
            locationManager.singleMode = true
            button.title = "RealTime"
            locationManager.stopUpdatingLocation()
        }
    }
    
    @objc private func refreshPlaces () {
        presenter?.refreshPlaces()
    }
    
}

extension NearByVC : ProNearByView {
    
    func fetchResults() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.reloadData()
    }
    
    func netWorkError() {
        mainView.tableView.backgroundView = EmptyView.setSomethingWrong()
    }
    
    func fetchPlaceImages(index: IndexPath, firstImage: String) {
        guard let cell = mainView.tableView.cellForRow(at: index) as? CellNearBy else {
            return
        }
        cell.setImagePlace(image: firstImage)
    }
    
}

// 37.53

extension NearByVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.getPlacesCount() ?? 0
        if count == 0 {
            tableView.backgroundView = EmptyView.setNoDataFound()
            return 0
        }
        tableView.backgroundView = nil
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNearBy.getIdentifier() , for: indexPath) as! CellNearBy
        presenter?.configurationCellPlace(cell: cell , index: indexPath.row)
        return cell
    }
    
    
    
    
}
