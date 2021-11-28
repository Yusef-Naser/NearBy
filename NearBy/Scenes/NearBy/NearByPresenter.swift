//
//  NearByPresenter.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//VC

import Foundation

protocol ProNearByView : StatusAPI {
    func netWorkError ()
    func fetchResults()
    func fetchPlaceImages (index : IndexPath, firstImage : String)
}

protocol ProNearByPresetner {

    func getNearByPlaces (lat : Double , lng : Double)
    func getPlace (index : Int) -> ModelResult?
    func getPlacesCount ()-> Int
    func configurationCellPlace (cell : CellNearByConfiguration , index : Int )
    func refreshPlaces ()
    func getPlaceImages (placeID : String , index : IndexPath)
}


class NearByPresenter : ProNearByPresetner {
    
    weak var view : ProNearByView?
    private let interactor = NearByInteractor()
    
    private var listResults : [ModelResult] = []
    private var lat : Double = 0.0
    private var lng : Double = 0.0
    
    init(view : ProNearByView ) {
        self.view = view
    }
    
    func getNearByPlaces(lat : Double , lng : Double) {
        self.lat = lat
        self.lng = lng
        self.view?.showLoading()
        interactor.getPlaces(lat: lat , lng: lng ) { data , error, statusCode in
            self.view?.hideLoading()
            guard statusCode != -1 else {
                self.view?.netWorkError()
                return
            }
            guard let results = data?.results else {
                return
            }
            self.listResults = results
            self.view?.fetchResults()
        }
    }
    
    func getPlacesCount() -> Int {
        listResults.count
    }
    
    func getPlace(index: Int) -> ModelResult? {
        guard listResults.count > index else {
            return nil
        }
        return listResults[index]
    }
    
    func configurationCellPlace(cell: CellNearByConfiguration, index: Int) {
        guard let place = getPlace(index: index) else {
            return
        }
        cell.setPlaceName(name: place.name)
        cell.setPlaceAddress(address: place.location?.address)
        getPlaceImages(placeID: place.fsqID ?? "" , index: IndexPath(row: index , section: 0))
    }
    
    func refreshPlaces() {
        interactor.getPlaces(lat: lat , lng: lng ) { data , error, statusCode   in
            self.view?.hideLoading()
            guard let results = data?.results else {
                return
            }
            self.listResults = results
            self.view?.fetchResults()
        }
    }
    
    func getPlaceImages(placeID : String , index: IndexPath) {
        interactor.getPlaceImages(placeID: placeID) { data , error , statusCode in
            guard let images = data , images.count > 0 else {
                return
            }
            let prefix = images[0].prefix ?? ""
            let suffix = images[0].suffix ?? ""
            let image = prefix + "original" + suffix
            self.view?.fetchPlaceImages(index: index , firstImage: image )
        }
    }
    
}
