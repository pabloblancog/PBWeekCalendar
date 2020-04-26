//
//  ViewController.swift
//  PBWeekCalendarExamples
//
//  Created by Pablo Blanco González on 19/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit
import PBWeekCalendar
import PBUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let selectedDate = try Date().addingDays(days: -1)
            let table = PBWeekCalendarCollectionView(frame: CGRect.zero,
                                                     currentDate: Date(),
                                                     selectedDate: selectedDate,
                                                     delegate: self)
            view.addSubview(table, topSpacing: 200, leadingSpacing: 0, bottomSpacing: 200, trailingSpacing: 0)
        } catch {
            print("Wrong selected date")
        }
    }
}

extension ViewController: PBWeekCalendarDelegate {
    func didSelect(date: Date) {
        print("Date selected: \(date.dateString)")
    }
}

