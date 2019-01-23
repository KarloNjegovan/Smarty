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
        
        let sURL = URL(string: "https://mjerenje.info/services/login.php")
        var request = URLRequest(url:sURL!)
        request.httpMethod = "POST"
        let postString = "user="+user!+"&pass="+pass!;
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil
            {
                self.stopActivityIndicator(activityIndicator: loading)
                self.throwError(msg: "Neuspjesan zahtjev, pokusajte ponovo")
                print("error=\(String(describing: error))")
                return
            }
            
            let authResponse = (String(data: data!, encoding: String.Encoding.utf8) ?? "Neuspjeh")
            
            if ((authResponse=="Neuspjeh")){
                self.stopActivityIndicator(activityIndicator: loading)
                self.throwError(msg: "Krivi podaci")
                return
            }
            
            DispatchQueue.main.async {
                let singedIn = self.storyboard?.instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
                let appDelegate = UIApplication.shared.delegate
                appDelegate?.window??.rootViewController = singedIn
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
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
