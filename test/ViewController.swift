//
//  ViewController.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.async {
            self.login()
        }
    }

    
    func login () {
        let api: UsersAPIProtocol = UsersAPI()
        
        api.login(name: "hossam@helmy.com", password: "123456789") { (result, status) in
            switch result {
            case .success(let data):
                if status == 200 {
                if data?.type == "success" {
                    print("done")
                }else{
                    print("Erronnr")
                }
                }
            case .failure(let error):
                print("Error Error Error ========>>>>>> \(error)")
            }
        }
        
    }

}

