//
//  ViewController.swift
//  POC2
//
//  Created by Suraj Sagare on 17/09/18.
//  Copyright © 2018 Suraj Sagare. All rights reserved.
//

import UIKit
import Gloss
import SVProgressHUD
import SDWebImage

class ViewController: UIViewController {
    var newDataObject : News?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        SVProgressHUD.show()
        guard let url = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=60aeaeae7fff4477958cfe2a8a6a76f5") else{return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                
                if let newsData: News = News(json: jsonResponse as! JSON) { //return fulfill(usersData)
                    self.newDataObject = newsData
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    SVProgressHUD.dismiss()
                }
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        if self.newDataObject?.results != nil{
//            return (self.newDataObject?.results.count)!
//        }else{
//            return 0
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.newDataObject?.results != nil{
            return (self.newDataObject?.results.count)!
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.itemsCategories?.item_categories[section].category
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)  as! CategoryCell
        
//        cell.imageView?.sd_setImage(with: <#T##URL?#>, completed: <#T##SDExternalCompletionBlock?##SDExternalCompletionBlock?##(UIImage?, Error?, SDImageCacheType, URL?) -> Void#>)
//
//        if self.itemsCategories?.item_categories != nil && self.itemsCategories?.item_categories[indexPath.section].itemArray != nil{
////            cell.idLabel.text =  self.itemsCategories?.item_categories[indexPath.section].itemArray[indexPath.row].item_id
//
//            if let desc = self.itemsCategories?.item_categories[indexPath.section].itemArray[indexPath.row].item_desc{
//                cell.descriptionLabel.text = "sasa"
//            }
//        }
        
      //------  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        if let imageValue = self.itemsCategories?.item_categories[indexPath.section].itemArray[indexPath.row].image{
//                print("Image",imageValue)
//               cell.imageView?.sd_setImage(with: URL(string: imageValue), placeholderImage: UIImage(named: "iconEmptyStateNotifications"))
//        }
     
//        cell.textLabel?.text =  self.itemsCategories?.item_categories[indexPath.section].itemArray[indexPath.row].item_desc
        
//        cell.textLabel?.text = (self.newDataObject?.results[indexPath.row].title)!
        cell.idLabel.text = (self.newDataObject?.results[indexPath.row].title)!
        cell.descriptionLabel.text = (self.newDataObject?.results[indexPath.row].abstract)!
        
        if let byString = self.newDataObject?.results[indexPath.row].byline{
           cell.byLabel.text = String("\(byString)")
        }
       
        if let publishedDateString = self.newDataObject?.results[indexPath.row].published_date{
            cell.dateLabel.text = String("\(publishedDateString)")
        }
        
        if let imageValue = self.newDataObject?.results[indexPath.row].mediaArray[0].mediaMetadataArray[1].url{
                            print("Image",imageValue)
                           cell.imageView?.sd_setImage(with: URL(string: imageValue), placeholderImage: UIImage(named: "iconEmptyStateNotifications"))
                    }
      
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.result = self.newDataObject?.results[indexPath.row]
        self.present(detailsViewController, animated:true, completion:nil)
    }
 
}
