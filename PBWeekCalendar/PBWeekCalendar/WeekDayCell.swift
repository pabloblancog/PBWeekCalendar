//
//  WeekDayCell.swift
//  PBWeekCalendar
//
//  Created by Pablo Blanco González on 21/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit
import PBUtils

protocol WeekDayCellProtocol {
    func setup()
}

struct WeekDayCellData {
    var dayLiteralString: String
    var dayNumberString: String
    var isSelected: Bool
    var isToday: Bool
}

class WeekDayCell: UICollectionViewCell {
    
    @IBOutlet weak var dayView: PBCircularLabelView!
    @IBOutlet weak var detailLabel: UILabel! {
        didSet {
            detailLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            detailLabel.textColor = .black
        }
    }
    
    func setup(cellData: WeekDayCellData) {
        backgroundColor = .clear
        layer.cornerRadius = 10
        dayView.setup(text: cellData.dayNumberString,
                      isSelected: cellData.isSelected,
                      isToday: cellData.isToday)
        
        detailLabel.text = cellData.dayLiteralString
    }
}
