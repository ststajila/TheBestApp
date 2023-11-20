//
//  AddViewController.swift
//  TheBestApp
//
//  Created by STANISLAV STAJILA on 11/15/23.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var descriptionOutlet: UITextView!
    @IBOutlet weak var DateOutlet: UIDatePicker!
    @IBOutlet weak var titleOutlet: UITextField!
    var delViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleOutlet.delegate = self
        descriptionOutlet.delegate = self
        
    }
    


    @IBAction func addAction(_ sender: Any) {
        var customDate =  DateOutlet.date.formatted(date: .numeric, time: .shortened)
        Delegate.planner.append(PlanData(title: titleOutlet.text!, date: customDate,description: descriptionOutlet.text!))
        delViewController.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleOutlet.resignFirstResponder()
        descriptionOutlet.resignFirstResponder()
        return true
    }
}
