//
//  FinModel
//

import Foundation

class FinModel: NSCoder {
    
    var title : String
    var link: String
    
    init(title: String, link: String)
    {
        self.title = title
        self.link = link
    }
    
    init (coder aDecoder: NSCoder!) {
        self.title = aDecoder.decodeObjectForKey("finTitle") as! String
        self.link = aDecoder.decodeObjectForKey("finLink") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(self.title, forKey: "finTitle")
        aCoder.encodeObject(self.link, forKey: "finLink")
    }
    
    
    
}