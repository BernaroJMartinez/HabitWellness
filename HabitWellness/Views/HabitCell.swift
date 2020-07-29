//
//  HabitCell.swift
//  HabitWellness
//
//  Created by Bernardo Martinez on 7/28/20.
//  Copyright © 2020 Bernardo Martinez. All rights reserved.
//

import UIKit

class HabitCell: UITableViewCell {
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImage)
        contentView.addSubview(habitLabel)
        contentView.addSubview(progressLabel)
        setUpIconImageConstraints()
        setUpHabitLabelConstraints()
        setUpProgressLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Elements of cell
    let iconImage: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        return icon
    }()
    
    let habitLabel: UILabel = {
        let habit = UILabel()
        habit.translatesAutoresizingMaskIntoConstraints = false
        habit.clipsToBounds = true
        habit.textColor = UIColor.black
        habit.backgroundColor = UIColor.clear
        return habit
    }()
    
    let progressLabel: UILabel = {
        let progress = UILabel()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.clipsToBounds = true
        progress.textColor = UIColor.black
        progress.backgroundColor = UIColor.clear
        return progress
    }()
    
    private func setUpIconImageConstraints(){
        iconImage.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalTo: iconImage.heightAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        iconImage.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        iconImage.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        iconImage.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        iconImage.trailingAnchor.constraint(
            equalTo: habitLabel.leadingAnchor,
            constant: SizeConstants.spacingBetweenElements).isActive = true
    }
    
    private func setUpHabitLabelConstraints(){
        habitLabel.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor).isActive = true
        habitLabel.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        habitLabel.trailingAnchor.constraint(
            greaterThanOrEqualTo: progressLabel.leadingAnchor,
            constant: SizeConstants.spacingBetweenElements).isActive = true
    }
    
    private func setUpProgressLabelConstraints(){
        progressLabel.heightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.heightAnchor).isActive = true
        progressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        progressLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}

struct SizeConstants{
    static let spacingBetweenElements: CGFloat = -20.0
}
