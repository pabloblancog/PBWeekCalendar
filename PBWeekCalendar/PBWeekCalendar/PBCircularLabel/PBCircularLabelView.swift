//
//  PBCircularLabelView.swift
//  PBWeekCalendar
//
//  Created by Pablo Blanco González on 24/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

class PBCircularLabelView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var textLabel: UILabel! {
        didSet {
            textLabel.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        loadNibContent()
    }
    
    public func setup(text: String, isSelected: Bool, isToday: Bool) {

        let backgroundColor: UIColor
        let textColor: UIColor
        let font: UIFont
        
        switch (isSelected, isToday) {
        case (true, true):
            backgroundColor = .red
            textColor = .white
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
        case (true, false):
            backgroundColor = .black
            textColor = .white
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
        case (false, true):
            backgroundColor = .clear
            textColor = .red
            font = UIFont.systemFont(ofSize: 16, weight: .regular)
        case (false, false):
            backgroundColor = .clear
            textColor = .black
            font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        
        self.backgroundColor = backgroundColor
        self.textLabel.textColor = textColor
        self.textLabel.font = font
        self.textLabel.text = text

        layer.cornerRadius = height / 2
    }
}
