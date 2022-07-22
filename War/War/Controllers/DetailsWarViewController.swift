//
//  DetailsWarViewController.swift
//  War
//
//  Created by Andrii Tymoshchuk on 20.07.2022.
//

import UIKit

class DetailsWarViewController: UIViewController {
    
    var equipmentOfDay: Equipment?
    var personnel: Persons?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let lableName: UILabel = {
        let lableName = UILabel()
        lableName.translatesAutoresizingMaskIntoConstraints = false
        lableName.text = "Russia's losses"
        lableName.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return lableName
    }()
    
    private var lableDay: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        return lable
    }()
    
    private var lossPersonLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(lableName)
        view.addSubview(lableDay)
        view.addSubview(lossPersonLable)
        view.backgroundColor = .systemBackground
        cfgTableView()
        cfgLable()
        lableDay.text = "Day \(personnel!.day)"
        lossPersonLable.text = "Personnel losses - \(personnel!.personnel)"
        print(equipmentOfDay)
    }
    
    func cfgLable() {
        NSLayoutConstraint.activate([
            lableName.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            lableName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lableDay.centerYAnchor.constraint(equalTo: lableName.centerYAnchor),
            lableDay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            lossPersonLable.topAnchor.constraint(equalTo: lableName.bottomAnchor, constant: 10),
            lossPersonLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func cfgTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lossPersonLable.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        tableView.register(DetailsWarTableViewCell.self, forCellReuseIdentifier: DetailsWarTableViewCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
}

extension DetailsWarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsWarTableViewCell.cellID) as! DetailsWarTableViewCell
        
        let menu = MenuModel(rawValue: indexPath.row)
        cell.lableName.text = menu?.description
        cell.iconImageView.image = menu?.image
        
        
        switch indexPath.row {
        case 0:
            cell.lableCount.text = String(equipmentOfDay!.aircraft)
        case 1:
            cell.lableCount.text = String(equipmentOfDay!.helicopter)
        case 2:
            cell.lableCount.text = String(equipmentOfDay!.tank)
        case 3:
            cell.lableCount.text = String(equipmentOfDay!.apc)
        case 4:
            cell.lableCount.text = String(equipmentOfDay!.fieldArtillery)
        case 5:
            cell.lableCount.text = String(equipmentOfDay!.mrl)
        case 6:
            if let item = equipmentOfDay?.militaryAuto {
                cell.lableCount.text = String(item)
            }
        case 7:
            if let item = equipmentOfDay?.fuelTank {
                cell.lableCount.text = String(item)
            }
        case 8:
            cell.lableCount.text = String(equipmentOfDay!.drone)
        case 9:
            cell.lableCount.text = String(equipmentOfDay!.navalShip)
        case 10:
            cell.lableCount.text = String(equipmentOfDay!.antiAircraftWarfare)
        case 11:
            if let item = equipmentOfDay?.vehiclesAndFuelTanks {
                cell.lableCount.text = String(item)
            }
        case 12:
            if let item = equipmentOfDay?.cruiseMissiles {
                cell.lableCount.text = String(item)
            } 
        default:
            break
        }
        
        return cell
    }
    
    
}
