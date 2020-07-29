//
//  HabitSectionHeader.swift
//  HabitWellness
//
//  Created by Bernardo Martinez on 7/28/20.
//  Copyright © 2020 Bernardo Martinez. All rights reserved.
//

import UIKit

class HabitSectionHeader: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubview(headerLabel)
        self.addSubview(addButton)
        setupHeaderLabelConstraints()
        setupAddButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupHeaderLabelConstraints(){
        headerLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
//        headerLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    private func setupAddButtonConstraints(){
        addButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        addButton.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1.0).isActive = true
    }

}
