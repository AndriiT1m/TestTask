//
//  DetailsWarTableViewCell.swift
//  War
//
//  Created by Andrii Tymoshchuk on 20.07.2022.
//

import Foundation
import UIKit

class DetailsWarTableViewCell: UITableViewCell {
    
    static let cellID = "cellID"
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let lableName: UILabel = {
        let lableName = UILabel()
        lableName.translatesAutoresizingMaskIntoConstraints = false
        lableName.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lableName
    }()
    
    let lableCount: UILabel = {
        let lableCount = UILabel()
        lableCount.translatesAutoresizingMaskIntoConstraints = false
        lableCount.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lableCount
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImageView)
        addSubview(lableName)
        addSubview(lableCount)
        cgfImage()
        cfgLables()
    }
    
    func cgfImage() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func cfgLables() {
        NSLayoutConstraint.activate([
            lableName.centerYAnchor.constraint(equalTo: centerYAnchor),
            lableName.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),

            lableCount.centerYAnchor.constraint(equalTo: centerYAnchor),
            lableCount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
