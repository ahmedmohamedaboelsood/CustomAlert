//
//  ViewController.swift
//  CustomAlert
//
//  Created by Ahmed on 29/03/2023.
//

import UIKit



class ViewController: UIViewController {
    
    //MARK: -  IBOutlets
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var loginView: UIView!
    
    //MARK: - Variables
    
    var email = "ahmed@gmail.com"
    var password = "123123"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetup()
        
    }
    
    //MARK: - Functions
    
    
    func uiSetup(){
        shadow(view: loginView)
        shadow(view: emailView)
        shadow(view: passwordView)
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
    }
    
    
    func shadow(view:UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        if view == loginView{
            view.layer.shadowOpacity = 0.5
        }else{
            view.layer.shadowOpacity = 0.1
        }
    }
    
    func validate(){
        
        guard let email = emailTxtField.text, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            let vc = storyboard?.instantiateViewController(withIdentifier: AlertVC.ID) as! AlertVC
            vc.message = "Please enter email"
            vc.state = "error"
            vc.alerttitle = "Alert"
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
            return
        }
        
        guard let password = passwordTxtField.text, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            let vc = storyboard?.instantiateViewController(withIdentifier: AlertVC.ID) as! AlertVC
            vc.message = "Please enter password"
            vc.state = "error"
            vc.alerttitle = "Alert"
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
            return
        }
        
    }
    
    
    //MARK: - IBActions
     
    
    @IBAction func loginBtn(_ sender: Any) {
        
        validate()
        if emailTxtField.text == email && passwordTxtField.text == password{
            let vc = storyboard?.instantiateViewController(withIdentifier: AlertVC.ID) as! AlertVC
            vc.message = "Logged Successfully"
            vc.state = "success"
            vc.alerttitle = "Alert"
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: AlertVC.ID) as! AlertVC
            vc.message = "Email or password is wrong try again"
            vc.state = "fail"
            vc.alerttitle = "Alert"
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        
    }
    
    
    
    
    
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.2 ){
           
            if self.emailTxtField.hasText {
                self.emailLbl.isHidden = false
                self.passwordLbl.isHidden = false
            }else if self.passwordTxtField.hasText{
                self.emailLbl.isHidden = false
                self.passwordLbl.isHidden = false
            }else{
                self.emailLbl.isHidden = true
                self.passwordLbl.isHidden = true
            }
            
        }
        
        
        
    
    }
    
    
    
    
    
    
}
