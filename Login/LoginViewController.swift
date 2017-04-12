//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
    }

    // TODO: instantiate the views needed for your project
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        let label = UILabel(frame: CGRect(x: 45,
                                   y: UIScreen.main.bounds.minY + 50,
                                   width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 5,
                                   height: 200))
        label.textColor = UIColor.white
        label.text = "Login View Controller"
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        let loginView = UIView(frame: CGRect(x: UIScreen.main.bounds.midX,
                                             y: UIScreen.main.bounds.midY,
                                             width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 10),
                                             height: 200))
        loginView.backgroundColor = UIColor.white
        loginView.center = view.center
        
        
        view.addSubview(loginView)
        view.addSubview(label)
        
        let loginButton = UIButton(frame: CGRect(x: loginView.bounds.midX / 2,
                                                 y: loginView.bounds.height - 60,
                                                 width: loginView.bounds.width / 2,
                                                 height: 50))
        loginButton.backgroundColor = Constants.backgroundColor
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        
        
        
        let loginTF = UITextField(frame: CGRect(x: loginView.bounds.minX,
                                                y: loginView.bounds.minY + 10,
                                                width: loginView.bounds.width,
                                                height: loginView.bounds.height / 4))
        loginTF.backgroundColor = UIColor.white
        loginTF.text = "berkeley.edu account"
        loginTF.textColor = UIColor.lightGray
        
        
        let passwordTF = UITextField(frame: CGRect(x: loginView.bounds.minX,
                                                   y: loginView.bounds.minY + loginView.bounds.height / 4 + 20,
                                                   width: loginView.bounds.width,
                                                   height: loginView.bounds.height / 4))
        passwordTF.backgroundColor = UIColor.white
        passwordTF.text = "password"
        passwordTF.textColor = UIColor.lightGray
        
        loginView.addSubview(loginTF)
        loginView.addSubview(passwordTF)
        loginView.addSubview(loginButton)
        
        
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        
        // TODO: layout your views using frames or AutoLayout
    }
    
    // TODO: create an IBAction for your login button
    
    
    
    
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
