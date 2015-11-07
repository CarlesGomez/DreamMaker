//
//  FinDetailsViewController.swift
//  DreamMaker


import UIKit

class FinDetailsViewController: UIViewController {

    /*REGION IBOUTLETS*/
    @IBOutlet weak var imgDream: UIImageView!
    @IBOutlet weak var lblDream: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var finOptionsTV: UITableView!
    /*ENDREGION IBOUTLETS*/
    
    var dream:Dream!
    var backButton = UIButton.back()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDetailData()
        //Add menu button
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        backButton.addTarget(self, action: "BackItemTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Make your dream true"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 27/255, green: 171/255, blue: 136/255, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*REGION TABLEVIEW EVENTS*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dream.finModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: FinOptionTableViewCell = tableView.dequeueReusableCellWithIdentifier("finOptionCell") as! FinOptionTableViewCell
        
        cell.finOptionTitle.text = dream.finModels[indexPath.row].title
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let url:NSURL? = NSURL(string: self.dream.finModels[indexPath.row].link )
        UIApplication.sharedApplication().openURL(url!)

    }
    /*ENDREGION TABLEVIEW EVENTS*/
    
    /*REGION METHODS*/
    func setDetailData()
    {
        self.lblDream.text = self.dream.title
        self.lblPrice.text = self.dream.price
        self.imgDream.image = UIImage(named: self.dream.imagePath)
    }

    @IBAction func BackItemTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*ENDREGION METHODS*/
    
}
