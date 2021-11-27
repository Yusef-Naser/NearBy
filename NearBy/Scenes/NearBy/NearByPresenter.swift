//
//  NearByPresenter.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//VC


protocol ProNearByView : StatusAPI {
    func netWorkError ()
    func fetchResults()
}

protocol ProNearByPresetner {

    func getNearByPlaces (lat : Double , lng : Double)
    func getPlace (index : Int) -> ModelResult?
    func getPlacesCount ()-> Int
    func configurationCellPlace (cell : CellNearByConfiguration , index : Int )
    func refreshPlaces ()
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
        interactor.getVenues(lat: lat , lng: lng ) { data , error, statusCode in
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
        cell.setImagePlace(image: "")
    }
    
    func refreshPlaces() {
        interactor.getVenues(lat: lat , lng: lng ) { data , error, statusCode   in
            self.view?.hideLoading()
            guard let results = data?.results else {
                return
            }
            self.listResults = results
            self.view?.fetchResults()
        }
    }
    
}
