//
//  DescriptionViewController.swift
//  TheBestApp
//
//  Created by STANISLAV STAJILA on 11/15/23.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionOutlet: UITextView!
    
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var dateOutlet: UILabel!
    
    var delViewController: UIViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        titleOutlet.text = Delegate.planner[Delegate.index].title
        dateOutlet.text = Delegate.planner[Delegate.index].date.formatted(date: .numeric, time: .shortened)
        descriptionOutlet.text = Delegate.planner[Delegate.index].description
        
        delViewController.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit"{
            let nvc = segue.destination as! EditViewController
            nvc.delViewController = self
        }
    }

}
