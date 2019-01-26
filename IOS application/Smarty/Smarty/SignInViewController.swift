//
//  SignInViewController.swift
//  Smarty
//
//  Created by Matija on 21/01/2019.
//  Copyright © 2019 Matija. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let user = username.text
        let pass = password.text
        
        if (user?.isEmpty)!||(pass?.isEmpty)! {
            throwError(msg: "Unesite korisnicko ime i lozinku!")
            return
        }
     
        let loading = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
            loading.center = view.center
            loading.hidesWhenStopped = false
            loading.startAnimating()
        view.addSubview(loading)
        
        let sURL = URL(string: "https://mjerenje.info/services/login.php?user="+user!+"&pass="+pass!)
        var request = URLRequest(url:sURL!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            self.stopActivityIndicator(activityIndicator: loading)
            if error != nil
            {
                self.throwError(msg: "Neuspjesan zahtjev, pokusajte ponovo")
                print("error=\(String(describing: error))")
                return
            }
            if data != nil{
                do {
                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options:[]) as? NSDictionary {
                        
                        let success = convertedJsonIntoDict["success"] as? Int
                        
                        if success == 1
                        {
                            DispatchQueue.main.async {
                                let singedIn = self.storyboard?.instantiateViewController(withIdentifier: "NaviController") as! UINavigationController
                                let appDelegate = UIApplication.shared.delegate
                                appDelegate?.window??.rootViewController = singedIn
                            }
                        }
                        else{
                            self.throwError(msg: "Krivi podaci")
                            return
                        }
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
               
            }
            
        }
        task.resume()
        
    }
    
    
    func throwError(msg:String) -> Void{
        DispatchQueue.main.async {
            let error = UIAlertController(title: "Greska", message: msg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default){
                (action:UIAlertAction!) in
                print(msg)
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            error.addAction(okAction)
            self.present(error, animated: true, completion: nil)
        }
    }
    
    func stopActivityIndicator(activityIndicator: UIActivityIndicatorView){
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }

    }
}
