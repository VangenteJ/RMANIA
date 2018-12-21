//
//  JoinController.swift
//  RMania
//
//  Created by Joel Vangente on 20/12/2018.
//  Copyright © 2018 Joel Vangente. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class JoinController: UIViewController {

    @IBOutlet weak var stackEntry2: UIStackView!
    @IBOutlet weak var stackEntry3: UIStackView!
    @IBOutlet weak var stackEntry4: UIStackView!
    @IBOutlet weak var stackEntry5: UIStackView!
    
    @IBOutlet weak var txtEntry1: UITextField!
    @IBOutlet weak var txtEntry2: UITextField!
    @IBOutlet weak var txtEntry3: UITextField!
    @IBOutlet weak var txtEntry4: UITextField!
    @IBOutlet weak var txtEntry5: UITextField!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var txtSelerName_Token: UITextField!
    
    var stack_control = 1
    
    var handle:DatabaseHandle?
    var ref:DatabaseReference!
    
    let user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getPrice_From_DB()

    }
    
    @IBAction func addEntry(_ sender: Any) {
        if stack_control < 5{
            stack_control = stack_control + 1
            if stack_control == 2{
                stackEntry2.isHidden = false
                getPrice_From_DB()
            }else if stack_control == 3{
                stackEntry2.isHidden = false
                stackEntry3.isHidden = false
                getPrice_From_DB()
            }else if stack_control == 4{
                stackEntry2.isHidden = false
                stackEntry3.isHidden = false
                stackEntry4.isHidden = false
                getPrice_From_DB()
            }else if stack_control == 5{
                stackEntry2.isHidden = false
                stackEntry3.isHidden = false
                stackEntry4.isHidden = false
                stackEntry5.isHidden = false
                getPrice_From_DB()
            }
        }
    }
    @IBAction func removeEntry(_ sender: Any) {
        if stack_control >= 2{
            if stack_control == 5{
                stackEntry5.isHidden = true
                getPrice_From_DB()
            }else if stack_control == 4{
                stackEntry4.isHidden = true
                stackEntry5.isHidden = true
                getPrice_From_DB()
            }else if stack_control == 3{
                stackEntry3.isHidden = true
                stackEntry4.isHidden = true
                stackEntry5.isHidden = true
                getPrice_From_DB()
            }else if stack_control == 2{
                stackEntry2.isHidden = true
                stackEntry3.isHidden = true
                stackEntry4.isHidden = true
                stackEntry5.isHidden = true
                getPrice_From_DB()
            }
            stack_control = stack_control - 1
        }
    }
    
    @IBAction func payment(_ sender: Any) {
        add_entry_to_db()
        add_seler_to_DB()
    }
    
    @IBAction func cancellation(_ sender: Any) {
        let goBack = self.storyboard?.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        self.present(goBack, animated: true, completion: nil)
    }
    
    func add_entry_to_db(){
        let item = ref.child("Description Values")
        handle = item.child("Item").observe(.value, with: { (snapshot) in
            if snapshot.value as? String != nil{
                let value = snapshot.value as? String
                
                let descriptions = self.ref.child(value!).child("Participants").child((self.user?.uid)!)
                if self.txtEntry1.text != ""{
                    let token = ((self.user?.uid)!)
                    let name_token = self.txtEntry1.text! + "_" + String(token.suffix(6))
                    descriptions.child("Entry1").setValue(name_token)
                }
                if self.txtEntry2.text != ""{
                    let token = ((self.user?.uid)!)
                    let name_token = self.txtEntry2.text! + "_" + String(token.suffix(6))
                    descriptions.child("Entry2").setValue(name_token)
                }
                if self.txtEntry3.text != ""{
                    let token = ((self.user?.uid)!)
                    let name_token = self.txtEntry3.text! + "_" + String(token.suffix(6))
                    descriptions.child("Entry3").setValue(name_token)
                }
                if self.txtEntry4.text != ""{
                    let token = ((self.user?.uid)!)
                    let name_token = self.txtEntry4.text! + "_" + String(token.suffix(6))
                    descriptions.child("Entry4").setValue(name_token)
                }
                if self.txtEntry5.text != ""{
                    let token = ((self.user?.uid)!)
                    let name_token = self.txtEntry5.text! + "_" + String(token.suffix(6))
                    descriptions.child("Entry5").setValue(name_token)
                }
            }
        })
        
    }
    
    func add_seler_to_DB(){
        let item = ref.child("Description Values")
        handle = item.child("Item").observe(.value, with: { (snapshot) in
            if snapshot.value as? String != nil{
                let value = snapshot.value as? String
                
                let descriptions = self.ref.child(value!).child("Salers").child((self.user?.uid)!)
                if self.txtSelerName_Token.text != ""{
                    descriptions.child("Name").setValue(self.txtSelerName_Token.text)
                }
            }
        })
    }
    
    func getPrice_From_DB(){
        let descriptions = ref.child("Description Values")
        handle = descriptions.child("PricePayPal").observe(.value, with: { (snapshot) in
            if snapshot.value as? NSNumber != nil{
                let value = snapshot.value as! NSNumber
                
                var total = (Float(truncating: value))
                if self.stack_control == 5{
                    total = total * 5
                    self.lblPrice.text = (String(format: "%.2f", total))
                }else if self.stack_control == 4{
                    total = total * 4
                    self.lblPrice.text = (String(format: "%.2f", total))
                }else if self.stack_control == 3{
                    total = total * 3
                    self.lblPrice.text = (String(format: "%.2f", total))
                }else if self.stack_control == 2{
                    total = total * 2
                    self.lblPrice.text = (String(format: "%.2f", total))
                }else if self.stack_control == 1{
                    total = total * 1
                    self.lblPrice.text = (String(format: "%.2f", total))
                }
            }
        })
    }

}
