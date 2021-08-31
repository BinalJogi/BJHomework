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

        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController

        vc?.title = "Hello: \(name)"
    
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

