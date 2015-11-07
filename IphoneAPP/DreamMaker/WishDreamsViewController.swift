//
//  WishDreamsViewController.swift
//

import UIKit
import AVKit

class WishDreamsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    
    /*REGION IBOUTLETS*/
   
    @IBOutlet weak var dreamList: UITableView!
  
    /*ENDREGION IBOUTLETS*/
    
    /*REGION VARIABLES*/
    var savedDreams = [Dream]()
    var collectionDreams = [Dream]()
    var lastDreamClicked:Dream = Dream(id: "0", title: "", videoPath: "", imagePath: "", price: "0", finModels: [])
    private var storyboardMine: UIStoryboard = UIStoryboard()
    /*ENDREGION VARIABLES*/
    
    /*REGION EVENTS*/
    override func viewDidLoad() {
        super.viewDidLoad()
        storyboardMine = UIStoryboard(name: "Main", bundle: nil)
        initDreams()
        getDreams()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //Configure bar settings
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    /*ENDREGION EVENTS*/
    
    /*REGION TABLEVIEW EVENTS*/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: DreamListCell = tableView.dequeueReusableCellWithIdentifier("dreamListCell") as! DreamListCell
        
        cell.setListDream(savedDreams[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return savedDreams.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let finDetailsVc:FinDetailsViewController = storyboardMine.instantiateViewControllerWithIdentifier("finDetailsVc") as! FinDetailsViewController
 
        finDetailsVc.dream = self.savedDreams[indexPath.row]
        let navigationController = UINavigationController(rootViewController: finDetailsVc)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
        
    }
    /*ENDREGION TABLEVIEW EVENTS*/
    
    /*REGION MÈTODES*/
    func initDreams()
    {
        collectionDreams = [
            Dream(id: "1", title: "Apple Watch", videoPath: "", imagePath: "watch", price: "819 €",
                finModels:[
                    FinModel(title: "Consíguelo con un préstamo", link: "https://portal.lacaixa.es/prestamoshipotecas/prestamoshipotecas_es.html")
                ]),
            Dream(id: "2", title: "BMW Serie 1", videoPath: "", imagePath: "bmw", price: "26.500 €",
                finModels:[
                    FinModel(title: "Consíguelo con un préstamo", link: "https://portal.lacaixa.es/prestamoshipotecas/prestamoshipotecas_es.html"),
                    FinModel(title: "Asegurar el coche", link: "https://portal.lacaixa.es/segurcaixaauto/homesegurcaixaauto_es.html")
                ]),
            Dream(id: "3", title: "Plan de jubilación", videoPath: "", imagePath: "caixa", price: "500 €/mes",
                finModels:[
                    FinModel(title: "Asegurar mi futuro", link: "https://portal.lacaixa.es/caixafuturo/caixafuturo_es.html")
                ]),
            Dream(id: "4", title: "Crucero por el mediterráneo", videoPath: "", imagePath: "costa", price: "449 €",
                finModels:[
                    FinModel(title: "Viajar sin preocupaciones", link: "https://portal.lacaixa.es/seguros/segurcaixaasistenciaenviaje_es.html"),
                    FinModel(title: "Consíguelo con un préstamo", link: "https://portal.lacaixa.es/prestamoshipotecas/prestamoshipotecas_es.html")
                ])
        ]
    }
    
    func getDreams()
    {
        var dataMine:NSData?
        let task = TaskQueue()
        
        //Do in background.
        task.tasks +=~ { result, next in
            
            var request = NSMutableURLRequest(URL: NSURL(string: "http://sompartyapp.com/appletv/real/selectDreams.php")!)
            
            NSURLSession.sharedSession().dataTaskWithRequest(request,
                completionHandler: {(data: NSData?, response: NSURLResponse?, error: NSError?) in
                    //process the response
                    if error != nil
                    {
                        print(error)
                        return
                    }
                    else
                    {
                        dataMine = data
                        print("In Background getdreams")
                        next(nil)
                    }
            }).resume()
        }
        
        task.tasks +=! {
            //Post Execute tmb.
        }
        
        task.run {
            print("Post execute getdreams")
            var string = NSString(data: dataMine!, encoding: NSUTF8StringEncoding)
            self.getCollectionDreams(String(string))
        };
    }
    
    func getCollectionDreams(var dreamsFromServer:String)
    {
        dreamsFromServer = dreamsFromServer.stringByReplacingOccurrencesOfString("Optional(", withString: "")
        dreamsFromServer = dreamsFromServer.stringByReplacingOccurrencesOfString(")", withString: "")
        var arrayIds = dreamsFromServer.characters.split{$0 == ":"}.map(String.init)

        for(var i = 0; i<arrayIds.count; i++)
        {
            var id = arrayIds[i]
            for dream in collectionDreams
            {
                if(dream.id == id)
                {
                    savedDreams.append(dream)
                    break;
                }
            }
        }
        self.dreamList.reloadData()
        self.dreamList.reloadInputViews()
    }
    /*ENDREGION MÈTODES*/
    
}
