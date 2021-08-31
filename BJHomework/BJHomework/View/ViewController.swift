//
//  ViewController.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtName.text = ""
    }

    @IBAction func btnSave(_ sender: Any) {
        
        guard let name = txtName.text else {
            return
        }
        if txtName.text?.count ?? 0 > 3 {
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController

            vc?.title = "Hello: \(name)"
        
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Minimum 3 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                @unknown default:
                    fatalError()
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

