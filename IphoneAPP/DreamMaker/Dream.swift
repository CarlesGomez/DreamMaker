//
//  Dream
//

import Foundation

class Dream: NSCoder {
    
    var id : String
    var title : String
    var videoPath : String
    var imagePath : String
    var price : String
    var finModels : [FinModel]
    
    init(id: String, title: String, videoPath: String, imagePath: String, price: String, finModels: [FinModel])
    {
        self.id = id
        self.title = title
        self.videoPath = videoPath
        self.imagePath = imagePath
        self.price = price
        self.finModels = finModels
    }
    
    init (coder aDecoder: NSCoder!) {
        self.id = aDecoder.decodeObjectForKey("dreamId") as! String
        self.title = aDecoder.decodeObjectForKey("dreamTitle") as! String
        self.videoPath = aDecoder.decodeObjectForKey("dreamVideoPath") as! String
        self.imagePath = aDecoder.decodeObjectForKey("dreamImagePath") as! String
        self.price = aDecoder.decodeObjectForKey("dreamPrice") as! String
        self.finModels = aDecoder.decodeObjectForKey("dreamFinModels") as! [FinModel]
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(self.id, forKey:"dreamId")
        aCoder.encodeObject(self.title, forKey:"dreamTitle")
        aCoder.encodeObject(self.videoPath, forKey:"dreamVideoPath")
        aCoder.encodeObject(self.imagePath, forKey:"dreamImagePath")
        aCoder.encodeObject(self.price, forKey:"dreamPrice")
        aCoder.encodeObject(self.finModels, forKey:"dreamFinModels")
    }
    
}