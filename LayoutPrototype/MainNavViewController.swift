//
//  MainNavViewController.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 07/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import UIKit

class MainNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        if isLoggedIn() {

            let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
            appDelegateTemp?.window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
            //            let homeController = HomeViewController()
  //          viewControllers = [homeController]
        } else {
            perform(#selector(presentLoginController), with: nil, afterDelay: 0.01)
        }
    }

    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    
    func presentLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
