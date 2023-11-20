//
//  ListViewController.swift
//  TheBestApp
//
//  Created by STANISLAV STAJILA on 11/15/23.
//

import UIKit

class PlanData: Codable{
    var title: String
    var date: String
    var description: String
   
    init(title: String, date: String, description: String) {
        self.title = title
        self.date = date
        self.description = description
    }
}

class delegate{
    static var planner: [PlanData] = []
    static var index: Int = 0
    
}


class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        delegate.planner = sortedByDate(plan: delegate.planner)
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.planner.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell") as! PlanCell
        
        cell.titleOutlet.text = delegate.planner[indexPath.row].title
        
        cell.dateOutlet.text = delegate.planner[indexPath.row].date
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.index = indexPath.row
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            delegate.planner.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   
    func sortedByDate(plan: [PlanData]) -> [PlanData]{
        return plan.sorted(by: { $0.date < $1.date })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "add"{
            let nvc = segue.destination as! AddViewController
            nvc.delViewController = self
        }
    }


}
