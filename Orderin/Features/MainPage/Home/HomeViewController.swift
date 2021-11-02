//
//  HomeViewController.swift
//  Orderin
//
//  Created by Novi Gunawan on 28/10/21.
//

import UIKit
import AuthenticationServices
import Firebase

class HomeViewController: UIViewController {

    static var signinViewController = SignInViewController()
    
    lazy var scanQRButton: UIButton = {
       let button = UIButton()
        button.setTitle("Scan QR Code", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scanQRButton)
     
    }
    @objc func scanQR() {
        // MARK: Check user has signed in or not
        
        Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                // MARK: User is signed in.
                // TODO: Go to Scan QR
                print("Scan QR")
            } else {
                // MARK: User is signed in.
                AlertServices.presentAlertSignedIn(onVC: self, message: "To Scan QR Code, you need to sign in first")
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scanQRButton.translatesAutoresizingMaskIntoConstraints = false
        scanQRButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        scanQRButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        scanQRButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        scanQRButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

    @IBAction func menuDetailDidtTapped(_ sender: Any) {
       let vc = MenuDetailViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        cancelOrder()
    }
    
    // Cancel Orde
    func cancelOrder() {
        
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 250, width: 250, height: 50)
        button.backgroundColor = UIColor.red
        button.setTitle("Cancel Order Button ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        
        let cancelViewController = CancelOrderViewController(nibName: Constant.CancelOrder.cancelViewController, bundle: nil)
        cancelViewController.modalPresentationStyle = .fullScreen
        self.present(cancelViewController, animated: true, completion: nil)
        
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
