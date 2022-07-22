//
//  ViewController.swift
//  War
//
//  Created by Andrii Tymoshchuk on 20.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var dateOfWar = [Persons]()
    private var equipment = [Equipment]()
    private var filteredDate = [Persons]()
    
    private var searchActive = false
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let lableDay: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Day"
        lable.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lable
    }()
    
    private let lableDate: UILabel = {
        let lableDate = UILabel()
        lableDate.translatesAutoresizingMaskIntoConstraints = false
        lableDate.text = "Date"
        lableDate.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lableDate
    }()
    
    private let lostPersons: UILabel = {
        let lostPersons = UILabel()
        lostPersons.translatesAutoresizingMaskIntoConstraints = false
        lostPersons.text = "Lost persons"
        lostPersons.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lostPersons
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "russian warship, go fuck off"
        view.addSubview(tableView)
        view.addSubview(lableDay)
        view.addSubview(lableDate)
        view.addSubview(lostPersons)
        view.backgroundColor = .systemBackground
        
        cfgTableView()
        cfgLable()
//        cfgSearchBar()
        decodePersonJson()
        decodeEquipmantJson()
        
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
//    func cfgSearchBar() {
//        let search = UISearchController(searchResultsController: nil)
//        search.searchBar.delegate = self
//        search.searchBar.placeholder = "Day or Date"
//        self.navigationItem.searchController = search
//    }
    
    func cfgLable() {
        NSLayoutConstraint.activate([
            lableDay.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            lableDay.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            lableDate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            lableDate.centerYAnchor.constraint(equalTo: lableDay.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lostPersons.centerYAnchor.constraint(equalTo: lableDay.centerYAnchor),
            lostPersons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func cfgTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lableDay.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
    }
    
    func decodePersonJson() {
        do {
            let decoder = JSONDecoder()
            dateOfWar = try decoder.decode([Persons].self, from: personListJSON)
        } catch {
            print(error)
        }
    }
    
    func decodeEquipmantJson() {
        do {
            let decoder = JSONDecoder()
            equipment = try decoder.decode([Equipment].self, from: equipListJSON)
        } catch {
            print(error)
        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailsWarViewController()
        vc.personnel = dateOfWar[indexPath.row]
        vc.equipmentOfDay = equipment[indexPath.row]
        navigationController?.show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filteredDate.count
        } else {
            return dateOfWar.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idCell) as! MainTableViewCell
        if searchActive {
            cell.dayLable.text = String(filteredDate[indexPath.row].day)
            cell.dateLable.text = filteredDate[indexPath.row].date
            cell.personLost.text = String(filteredDate[indexPath.row].personnel)
        } else {
            cell.dayLable.text = String(dateOfWar[indexPath.row].day)
            cell.dateLable.text = dateOfWar[indexPath.row].date
            cell.personLost.text = String(dateOfWar[indexPath.row].personnel)
        }
        return cell
    }
    
}

//extension MainViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchBar.text, !text.isEmpty else { return }
//        dateOfWar.forEach { date in
//            if String(date.day) == text || date.date == text {
//                filteredDate.append(date)
//                searchActive = true
//            }
//
//            self.tableView.reloadData()
//        }
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchActive = false
//        filteredDate.removeAll()
//        tableView.reloadData()
//    }
//
//
//}
