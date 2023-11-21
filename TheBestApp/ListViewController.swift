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
    var isFavorite: Bool
   
    init(title: String, date: Date, description: String) {
        self.title = title
        self.date = date
        self.description = description
        self.isFavorite = false
    }
}

class Delegate{
    static var planner: [PlanData] = []
    static var index: Int = 0
    static var currentDate: Date = Date.now
}


class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        Delegate.currentDate = Date.now
        Delegate.planner = sortedByDate(plan: Delegate.planner)
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Delegate.planner.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell") as! PlanCell
        if(Delegate.currentDate > Delegate.planner[indexPath.row].date){
            cell.dateOutlet.textColor = UIColor.red
        } else {
            cell.dateOutlet.textColor = UIColor.black
        }
        cell.titleOutlet.text = Delegate.planner[indexPath.row].title
        
        cell.dateOutlet.text = Delegate.planner[indexPath.row].date.formatted(date: .numeric, time: .shortened)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Delegate.index = indexPath.row
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Delegate.planner.remove(at: indexPath.row)
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
