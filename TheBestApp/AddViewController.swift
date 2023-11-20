//
//  AddViewController.swift
//  TheBestApp
//
//  Created by STANISLAV STAJILA on 11/15/23.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var descriptionOutlet: UITextView!
    @IBOutlet weak var DateOutlet: UIDatePicker!
    @IBOutlet weak var titleOutlet: UITextField!
    var delViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    @IBAction func addAction(_ sender: Any) {
        var customDate =  DateOutlet.date.formatted(date: .numeric, time: .shortened)
        delegate.planner.append(PlanData(title: titleOutlet.text!, date: customDate,description: descriptionOutlet.text!))
        delViewController.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
    }
}
