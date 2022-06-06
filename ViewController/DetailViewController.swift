//
//  DetailViewController.swift
//  iTunesSearchText
//
//  Created by Yasin Dalkilic on 6.06.2022.
//

import UIKit
import AlamofireImage
import Alamofire

class DetailViewController: UIViewController {
    var resultsInDetail : Results?
    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var labelArtistName: UILabel!
    @IBOutlet weak var labelCollectionNAme: UILabel!
    @IBOutlet weak var labelTrackName: UILabel!
    @IBOutlet weak var labelCollectionPrice: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    var setURL = URL(string: "https://stackoverflow.com/")
    var dateConverted = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imageArtist.af_setImage(withURL: ((URL(string: (self.resultsInDetail?.artworkUrl100!)!) ?? self.setURL)!))
        self.labelArtistName.text = "\(self.resultsInDetail?.artistName ?? "")"
        self.labelCollectionNAme.text = "\(self.resultsInDetail?.collectionName ?? "")"
        self.labelTrackName.text = "\(self.resultsInDetail?.trackName ?? "")"
        self.labelCollectionPrice.text = "Price : \(self.resultsInDetail?.collectionPrice ?? 0.0)"
        self.dateFormatChange(dateString: "\(self.resultsInDetail?.releaseDate ?? "")")
        self.labelReleaseDate.text = "Release Date : \(self.dateConverted)"
        self.labelCountry.text = "Country : \(self.resultsInDetail?.country ?? "")"
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
    
    init(results : Results?){
        self.resultsInDetail = results
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
