//
//  LoginViewController.swift
//  Twitter
//
//  Created by Kyle George on 3/6/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }//end of viewDidLoad
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }//end of viewDidAppear
    
    @IBAction func onLoginButton(_ sender: Any) {
        //print("Button action invoked")
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login!")
        })
    }//end of onLoginButton
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//end of LoginViewController
