//
//  ViewController.swift
//  RMania
//
//  Created by Joel Vangente on 28/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

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
    
    var user:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLogged()
    }


    @IBAction func btnLogin_Register(_ sender: Any) {
        
        if let email = txtEmail.text, let pass = txtPassword.text, let pass2 = txtRePassword.text {
            if segLog_reg.selectedSegmentIndex == 0 {
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    if user != nil{
                        self.performSegue(withIdentifier: "menu", sender: self)
                    }else{
                        self.lblLog_Reg.text = "Please enter correct details!"
                    }
                }
            }else {
                if pass2 == pass{
                    Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                        if user != nil {
                            self.mainMenu()
                        }
                    }
                }
            }
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
    
    func isLogged(){
        if Auth.auth().currentUser != nil{
            mainMenu()
        }else{
            print ("It iss nil")
        }
    }
    
    func mainMenu(){
        let goTo_Main = self.storyboard?.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        self.present(goTo_Main, animated: true, completion: nil)
    }
}

