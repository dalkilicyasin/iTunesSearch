

import Foundation
import UIKit
import ObjectMapper

public class  SearchListRequestModel : Mappable{
    
    var term = ""
    var entity = ""
    
    public required init?(map: Map) {
        
    }
    
    public init (term : String, entity : String){
        self.term = term
        self.entity = entity
    }

    
    public func mapping(map: Map) {
    }
    
    public func requestPathString()->String{
        // 2. parametre eklemek için & işareti koy
        return "?term=\(self.term)&entity=\(self.entity)&limit=20"
    }
    
}
