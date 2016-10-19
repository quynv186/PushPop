//
//  LoginController.swift
//  Mp3
//
//  Created by admin on 10/18/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var tf_User: UITextField!
    @IBOutlet weak var tf_Password: UITextField!
    @IBOutlet weak var lbl_Result: UILabel!
    @IBOutlet weak var lbl_Print: UILabel!

    var users = ["an":"123","binh":"456","hanh":"789"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor: UIColor = UIColor.white
        tf_User.layer.borderColor = myColor.cgColor
        tf_Password.layer.borderColor = myColor.cgColor
        tf_User.layer.borderWidth = 1.0
        tf_Password.layer.borderWidth = 1.0
        
        self.tf_User.layer.cornerRadius = CGFloat(Float(6))
        self.tf_Password.layer.cornerRadius = CGFloat(Float(6))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_Login(_ sender: UIButton) {
        if let pass = users[tf_User.text!] {
            if pass == tf_Password.text {
                lbl_Result.text = "Login sucess"
                let vMath = self.storyboard?.instantiateViewController(withIdentifier: "Math")
                self.navigationController?.pushViewController(vMath!, animated: true)
            } else {
                lbl_Result.text = "Login fail"
            }
        } else {
            lbl_Result.text = "Invail User"
        }
        
    }
    
    @IBAction func action_List(_ sender: UIButton) {
        var list: String = ""
        for user in users {
            list = list + "userName: \(user.0) " + " - Password: \(user.1) \n"
        }
        
        lbl_Print.text = list
    }
    

}
