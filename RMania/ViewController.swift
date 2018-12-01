//
//  ViewController.swift
//  RMania
//
//  Created by Joel Vangente on 28/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segLog_reg: UISegmentedControl!
    
    @IBOutlet weak var lblLog_Reg: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblReenter_Password: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRePassword: UITextField!
    
    @IBOutlet weak var btnLog_Reg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnLogin_Register(_ sender: Any) {
        if segLog_reg.selectedSegmentIndex == 0 {
            let goTo_Main = self.storyboard?.instantiateViewController(withIdentifier: "MenuController") as! MenuController
            self.present(goTo_Main, animated: true, completion: nil)
        }else {
            
        }
    }
    
    @IBAction func segLog_Reg(_ sender: Any) {
        if segLog_reg.selectedSegmentIndex == 0 {
            lblLog_Reg.text = "Log in"
            btnLog_Reg.setTitle("Log in", for: .normal)
            txtRePassword.isHidden = true
            lblReenter_Password.isHidden = true
        }else {
            lblLog_Reg.text = "Register"
            btnLog_Reg.setTitle("Register", for: .normal)
            txtRePassword.isHidden = false
            lblReenter_Password.isHidden = false

        }
    }
    
}

