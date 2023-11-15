//
//  ListViewController.swift
//  TheBestApp
//
//  Created by STANISLAV STAJILA on 11/15/23.
//

import UIKit

class PlanData: Codable{
    var title: String
    var date: Date
    var description: String
    
}

class delegate{
    static var planner: [PlanData] = []
}


class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.planner.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "planCell") as! PlanCell
        
        cell.titleOutlet.text = delegate.planner[indexPath.row].title
        cell.dateOutlet.text = "\(delegate.planner[indexPath.row].date)"
        
        return cell
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
