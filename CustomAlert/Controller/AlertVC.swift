//
//  AlertVC.swift
//  CustomAlert
//
//  Created by Ahmed on 29/03/2023.
//

import UIKit
import Lottie
class AlertVC: UIViewController {
    
    //MARK: - IBOUtlets
    
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var lottiView: UIView!
    
    //MARK: - IBActions
    
    private var animationView : LottieAnimationView!
    static var ID = String(describing: AlertVC.self)
    var state : String?
    var alerttitle : String?
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetUp()
    }
    
    //MARK: - Functions
     
    func alert(state:String , title : String , message : String){
        animationView = .init(name: state)
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 2.5
        lottiView.addSubview(animationView)
        animationView.play() 
    }
    
    func uiSetUp(){
        alertView.layer.borderWidth = 1
        alertView.layer.borderColor = UIColor.black.cgColor
        alertTitle.text = title
        alertMessage.text = message
        alert(state: state!, title: alerttitle!, message: message!)
    }
    
    
    
    //MARK: - IBActions
    
    
    @IBAction func OkBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}
