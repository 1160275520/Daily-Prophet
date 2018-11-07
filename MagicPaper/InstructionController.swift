//
//  InstructionController.swift
//  MagicPaper
//
//  Created by Mac Air on 2018/8/29.
//  Copyright © 2018 Yiwen Wang. All rights reserved.
//

import UIKit

class InstructionController: UIViewController {
    
    @IBOutlet weak var first: UITextView!
    @IBOutlet weak var second: UITextView!
    @IBOutlet weak var third: UITextView!
    @IBOutlet weak var fourth: UITextView!
    
    var touchTimes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        first.sizeToFit()
        second.sizeToFit()
        disableEditing()
        hideText()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func disableEditing(){
        first.isEditable = false
        second.isEditable = false
        third.isEditable = false
        fourth.isEditable = false
    }
    
    func hideText(){
        first.isHidden = true
        second.isHidden = true
        third.isHidden = true
        fourth.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchTimes = touchTimes + 1
        showText()
    }
    
    func showText(){
        if (touchTimes == 1){
            first.isHidden = false
        }
        else if (touchTimes == 2){
            second.isHidden = false
        }
        else if (touchTimes == 3){
            third.isHidden = false
        }
        else if (touchTimes == 4){
            fourth.isHidden = false
        }
        else{
            performSegue(withIdentifier: "goToNewspaper", sender: self)
        }
    }

}
