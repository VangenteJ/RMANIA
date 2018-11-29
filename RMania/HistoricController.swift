//
//  HistoricController.swift
//  RMania
//
//  Created by Joel Vangente on 29/11/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit

class HistoricController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Back(_ sender: Any) {
        let goBack = self.storyboard?.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        self.present(goBack, animated: true, completion: nil)
    }
    

}
