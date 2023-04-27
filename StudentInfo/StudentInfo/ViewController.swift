//
//  ViewController.swift
//  StudentInfo
//
//  Created by Mac on 02/02/1945 Saka.
//

import UIKit

class ViewController: UIViewController {
    let context = DataBaseHandler().context
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func addInfo(_ sender: Any) {
    
        var firstName = firstNameTextField.text!
    let lastName = lastNameTextField.text!
    let email = emailTextField.text!
    let mobileNumber = mobileNumberTextField.text!
    let addStudentVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        guard let firstName = firstNameTextField.text,!firstName.isEmpty else {
    openAlert(message: "please enter your firstName")
            return
        }
    guard let lastName = lastNameTextField.text,!lastName.isEmpty else {
    openAlert(message: "please enter your lastName")
            return
        }
    guard let email = emailTextField.text,!email.isEmpty else {
    openAlert(message: "please enter your email")
        return
        }
        guard let mobileNumber = mobileNumberTextField.text,!mobileNumber.isEmpty else{
     openAlert(message: "please enter your mobileNumber")
            return
        }
        
        DataBaseHandler().saveData(firstName: firstName, lastName: lastName,email:email,mobileNumber: mobileNumber)
    print("save button Click")
        self.navigationController?.pushViewController(addStudentVC, animated: true)
    }
}

extension ViewController{
    func openAlert(message : String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okay)
        self.present(alertController, animated: true)
    }
}


