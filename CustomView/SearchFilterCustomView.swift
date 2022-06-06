

import Foundation
import UIKit

protocol SearchFilterCustomViewDelegate {
    func tappedMusic()
    func tappedVideo()
    func tappedBook()
    func tappedMovie()
}

class SearchFilterCustomView: UIView {
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var viewMusicView: UIView!
    @IBOutlet weak var labelMusic: UILabel!
    @IBOutlet weak var viewVideo: UIView!
    @IBOutlet weak var labelVideo: UILabel!
    @IBOutlet weak var viewMovie: UIView!
    @IBOutlet weak var labelMovie: UILabel!
    @IBOutlet weak var viewBook: UIView!
    @IBOutlet weak var labelBook: UILabel!
    var searchFilterDelegate : SearchFilterCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(String(describing: SearchFilterCustomView.self), owner: self, options: nil)
        self.headerView.addCustomContainerView(self)
        self.buttonColor(viewColor: self.viewMusicView)
    }
    
    @IBAction func musicButtomnTapped(_ sender: Any) {
        self.buttonColor(viewColor: self.viewMusicView)
        self.searchFilterDelegate?.tappedMusic()
    }
    
    @IBAction func videoButtonTapped(_ sender: Any) {
        self.buttonColor(viewColor: self.viewVideo)
        self.searchFilterDelegate?.tappedVideo()
    }
    
    @IBAction func movieButtonTapped(_ sender: Any) {
        self.buttonColor(viewColor: self.viewMovie)
        self.searchFilterDelegate?.tappedMovie()
    }
    
    @IBAction func bookButtonTapped(_ sender: Any) {
        self.buttonColor(viewColor: self.viewBook)
        self.searchFilterDelegate?.tappedBook()
    }
    
    func buttonColor( viewColor : UIView ){
        self.viewMusicView.backgroundColor = UIColor.lightGray
        self.viewBook.backgroundColor = UIColor.lightGray
        self.viewMovie.backgroundColor = UIColor.lightGray
        self.viewVideo.backgroundColor = UIColor.lightGray
        viewColor.backgroundColor = UIColor.white
    }
    
}


