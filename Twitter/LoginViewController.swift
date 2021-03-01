//
//  LoginViewController.swift
//  Twitter
//
//  Created by Malcolm Johnson on 2/28/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {

        if UserDefaults.standard.bool(forKey: "userLoggedin") == true {
            self.performSegue(withIdentifier: "logintoHome", sender: self)
            UserDefaults.standard.set(false,forKey: "userLoggedin")

        }
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
            
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedin")
            self.performSegue(withIdentifier: "logintoHome", sender: self)
        }, failure: { (Error) in
            print("Couldnt Login")
        })
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
