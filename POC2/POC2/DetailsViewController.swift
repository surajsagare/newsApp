//
//  DetailsViewController.swift
//  POC2
//
//  Created by Suraj Sagare on 23/10/18.
//  Copyright © 2018 Suraj Sagare. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    var result : Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageValue = self.result?.mediaArray[0].mediaMetadataArray[0].url{
            print("Image",imageValue)
            imageView.sd_setImage(with: URL(string: imageValue), placeholderImage: UIImage(named: "iconEmptyStateNotifications"))
        }
        descriptionLabel.text = self.result?.abstract
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
