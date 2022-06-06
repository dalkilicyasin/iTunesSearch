//
//  ViewController.swift
//  iTunesSearchText
//
//  Created by Yasin Dalkilic on 3.06.2022.
//

import UIKit
import AlamofireImage
import Alamofire

class MainViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewSearchFilterView: SearchFilterCustomView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var viewMainView: MainView!
    var artistNameList : [String] = []
    var catagory = "musicVideo"
    var searchText = ""
    var resultList : [Results] = []
    var setURL = URL(string: "https://stackoverflow.com/")
    var dateConverted = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(SearchListCollectionViewCell.nib, forCellWithReuseIdentifier: SearchListCollectionViewCell.identifier)
        self.searchBar.delegate = self
        self.viewSearchFilterView.searchFilterDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.hideKeyboardWhenTappedAround()
    }
    
    func dateFormatChange(dateString : String) {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString)!
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        self.dateConverted = dateString
    }
    
    func fetchingList( ){
        let requestSearchText = SearchListRequestModel.init(term: self.searchText, entity: self.catagory)
        NetworkManager.sendGetRequest(url:NetworkManager.BASEURL, endPoint: .search, method: .get, parameters: requestSearchText.requestPathString()) { (response : SearchListResponseModel ) in
            if response.results != nil {
                self.resultList = response.results ?? self.resultList
                self.collectionView.reloadData()
            }
        }
    }
}

extension  MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resultList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchListCollectionViewCell.identifier, for: indexPath) as! SearchListCollectionViewCell
        cell.labelName.text = self.resultList[indexPath.row].collectionName
        cell.imageArtist.af_setImage(withURL: ((URL(string: self.resultList[indexPath.row].artworkUrl100!) ?? self.setURL)!))
        cell.labelCollectionPrice.text = "Price : \(self.resultList[indexPath.row].collectionPrice ?? 0.0)"
        self.dateFormatChange(dateString: "\(self.resultList[indexPath.row].releaseDate ?? "")")
        cell.labelReleaseDate.text = self.dateConverted
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.iTunesPushViewController(viewController: DetailViewController.init(results: self.resultList[indexPath.row]))
    }
}

extension MainViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.elementsEqual(""){
            self.resultList = []
            self.collectionView.reloadData()
        }else if searchText.count > 2{
            if searchText.description.lowercased().contains(searchText.lowercased()){
                self.searchText = searchText
                self.fetchingList()
                
            }
        }
    }
}


extension  MainViewController : SearchFilterCustomViewDelegate {
    
    func tappedMusic() {
        self.catagory = "musicVideo"
        if self.resultList.count == 0 {
            return
        }else{
            self.fetchingList()
        }
    }
    
    func tappedVideo() {
        self.catagory = "podcast"
        if self.resultList.count == 0 {
            return
        }else{
            self.fetchingList()
        }
    }
    
    func tappedBook() {
        self.catagory = "audiobook"
        if self.resultList.count == 0 {
            return
        }else{
            self.fetchingList()
        }
    }
    
    func tappedMovie() {
        self.catagory = "movie"
        if self.resultList.count == 0 {
            return
        }else{
            self.fetchingList()
        }
    }
}

