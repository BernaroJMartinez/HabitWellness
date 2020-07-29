//
//  HomeViewController.swift
//  HabitWellness
//
//  Created by Bernardo Martinez on 7/27/20.
//  Copyright © 2020 Bernardo Martinez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: InterfaceBuilder Outlets
    @IBOutlet weak var habitTableView: UITableView!
    
    // MARK: Variables and Constants
    let reusableIdentifierCell = "Habits"
    let reusableIdentifierHeader = "Header"
    
    // Model Connection
    var habitData = HabitHomeData()
    
    // MARK: ViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        habitTableView.delegate = self
        habitTableView.dataSource = self
        habitTableView.register(HabitCell.self, forCellReuseIdentifier: reusableIdentifierCell)
        habitTableView.register(HabitSectionHeader.self, forHeaderFooterViewReuseIdentifier: reusableIdentifierHeader)
        habitTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    // MARK: TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return habitData.goodHabits.count
        case 1:
            return habitData.badHabits.count
        default:
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section{
//        case 0:
//            return "Good Habits"
//        case 1:
//            return "Bad Habits"
//        default:
//            return "Error"
//        }
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: reusableIdentifierHeader) as! HabitSectionHeader
        switch section{
        case 0:
            header.headerLabel.text = "Good Habits"
        case 1:
            header.headerLabel.text = "Bad Habits"
        default:
            header.headerLabel.text = "Error"
        }
//        header.addButton.addTarget(self,
//                                   action: #selector(addRowFromHeader(header:)),
//                                   for: .touchUpInside)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifierCell, for: indexPath) as! HabitCell
        switch indexPath.section {
        case 0:
            cell.habitLabel.text = habitData.goodHabits[indexPath.row]
        case 1:
            cell.habitLabel.text = habitData.badHabits[indexPath.row]
        default:
            return cell
        }
        cell.progressLabel.text = "Gooood joob"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    // MARK: Helper Functions
    
//    @objc func addRowFromHeader(header: HabitSectionHeader){
//        habitData.goodHabits.append("New Habit".madeUnique(withRespectTo: habitData.goodHabits))
//        habitData.badHabits.append("New Habit".madeUnique(withRespectTo: habitData.badHabits))
//        habitTableView.insertRows(at: [IndexPath(row: habitData.goodHabits.count,
//                                                section: 0)],
//                                  with: .fade)
//        habitTableView.insertRows(at: [IndexPath(row: habitData.badHabits.count,
//                                                 section: 1)],
//                                  with: .fade)
//    }

}

extension String {
    func madeUnique(withRespectTo otherStrings: [String]) -> String {
        var possiblyUnique = self
        var uniqueNumber = 1
        while otherStrings.contains(possiblyUnique) {
            possiblyUnique = self + " \(uniqueNumber)"
            uniqueNumber += 1
        }
        return possiblyUnique
    }
}

extension Array where Element: Equatable {
    var uniquified: [Element] {
        var elements = [Element]()
        forEach { if !elements.contains($0) { elements.append($0) } }
        return elements
    }
}
