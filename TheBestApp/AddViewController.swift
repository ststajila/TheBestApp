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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addAction(_ sender: Any) {
        delegate.planner.append(PlanData(title: titleOutlet.text!,date: DateOutlet.date,description: descriptionOutlet.text!))
        
    }
}
