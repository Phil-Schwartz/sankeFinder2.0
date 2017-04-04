//
//  DetailViewController.swift
//  UISplitViewController Xcode 7
//
//  Created by PJ Vea on 9/8/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
// MARK: Properties
    
    @IBOutlet weak var Color: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var colorLable: UILabel!
    @IBOutlet weak var endangeredLabel: UILabel!
    @IBOutlet weak var venomousLabel: UILabel!
    
    var titleText: String!
    var infoText: String!
    var colorText: String!
    var snakeImage: UIImage?
    var colorTitle: String?
    var endangeredText: String?
    var venemousText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Color.text = self.colorTitle
        self.titleLabel.text = self.titleText
        self.infoLabel.text = self.infoText
        infoLabel.numberOfLines=0
        infoLabel.sizeToFit()
        self.colorLable.text = self.colorText
        self.endangeredLabel.text = self.endangeredText
        self.imageView.image = self.snakeImage
        self.venomousLabel.text = self.venemousText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
