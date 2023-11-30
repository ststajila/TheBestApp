//
//  EditViewController.swift
//  TheBestApp
//
//  Created by Stanislav Stajila on 11/29/23.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{

    @IBOutlet weak var descriptionOutlet: UITextView!
    @IBOutlet weak var DateOutlet: UIDatePicker!
    @IBOutlet weak var titleOutlet: UITextField!
    var delViewController: UIViewController!
    var alert = UIAlertController(title: "Error", message: "You need to add a title to save the event", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleOutlet.delegate = self
        descriptionOutlet.delegate = self
        
        titleOutlet.text = Delegate.planner[Delegate.index].title
        descriptionOutlet.text =  Delegate.planner[Delegate.index].description
        DateOutlet.date =  Delegate.planner[Delegate.index].date
        
        var okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
    }
    
        @IBAction func saveAction(_ sender: Any) {
            if titleOutlet.text != ""{
                Delegate.planner[Delegate.index].title = titleOutlet.text!
                Delegate.planner[Delegate.index].description = descriptionOutlet.text
                Delegate.planner[Delegate.index].date = DateOutlet.date
                delViewController.viewDidLoad()
                self.dismiss(animated: true, completion: nil)
                
            } else{
                present(alert, animated: true)
            }
        }
        
        
        @IBAction func cancelAction(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            titleOutlet.resignFirstResponder()
            return true
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if(text == "\n") {
                        descriptionOutlet.resignFirstResponder()
                        return false
                    }
                    return true
        }
}
