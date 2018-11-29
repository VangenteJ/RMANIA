//
//  ViewController.swift
//  RMania
//
//  Created by Joel Vangente on 28/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnLogin_Register(_ sender: Any) {
        let goTo_Main = self.storyboard?.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        self.present(goTo_Main, animated: true, completion: nil)
    }
    
}

