//
//  NewspaperViewController.swift
//  Daily Prophet
//
//  Created by Mac Air on 2018/8/30.
//  Copyright © 2018 Yiwen Wang. All rights reserved.
//

import UIKit

class NewspaperViewController: UIViewController {

    @IBOutlet weak var newspaper: UIImageView!
  
    @IBAction func first(_ sender: Any) {
        let image = UIImage.init(named: "1")
        newspaper.image = image
    }
    @IBAction func second(_ sender: Any) {
        let image = UIImage.init(named: "2")
        newspaper.image = image
    }
    @IBAction func third(_ sender: Any) {
        let image = UIImage.init(named: "3")
        newspaper.image = image
    }
    @IBAction func fouth(_ sender: Any) {
        let image = UIImage.init(named: "4")
        newspaper.image = image
    }
    @IBAction func fifth(_ sender: Any) {
        let image = UIImage.init(named: "5")
        newspaper.image = image
    }
    @IBAction func sixth(_ sender: Any) {
        let image = UIImage.init(named: "6")
        newspaper.image = image
    }
    @IBAction func seventh(_ sender: Any) {
        let image = UIImage.init(named: "7")
        newspaper.image = image
    }
    @IBAction func eighth(_ sender: Any) {
        let image = UIImage.init(named: "8")
        newspaper.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    

}
