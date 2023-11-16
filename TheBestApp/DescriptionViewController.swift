//
//  DescriptionViewController.swift
//  TheBestApp
//
//  Created by STANISLAV STAJILA on 11/15/23.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionOutlet: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionOutlet.text = delegate.planner[delegate.index].description
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
