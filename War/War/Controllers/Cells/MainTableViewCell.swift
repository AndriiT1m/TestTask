//
//  MainTable.swift
//  War
//
//  Created by Andrii Tymoshchuk on 20.07.2022.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let idCell = "mainCell"
    
    let dayLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return lable
    }()
    
    let dateLable: UILabel = {
        let datalable = UILabel()
        datalable.translatesAutoresizingMaskIntoConstraints = false
        datalable.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return datalable
    }()
    
    let personLost: UILabel = {
        let datalable = UILabel()
        datalable.translatesAutoresizingMaskIntoConstraints = false
        datalable.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return datalable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dayLable)
        addSubview(dateLable)
        addSubview(personLost)
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            dayLable.centerYAnchor.constraint(equalTo: centerYAnchor),
            dayLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            dateLable.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            dateLable.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            personLost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            personLost.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
