//
//  PBWeekCalendarCollectionView.swift
//  PBWeekCalendar
//
//  Created by Pablo Blanco González on 19/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit
import PBUtils

public protocol PBWeekCalendarDelegate {
    func didSelect(date: Date)
}

public class PBWeekCalendarCollectionView: UICollectionView {

    private let weekCalendarLayout: UICollectionViewLayout = {
        let weekCalendarLayout = UICollectionViewFlowLayout()
        weekCalendarLayout.scrollDirection = .horizontal
        weekCalendarLayout.minimumInteritemSpacing = 0.0
        weekCalendarLayout.minimumLineSpacing = 0.0
        return weekCalendarLayout
    }()
    
    private var currentDate: Date = Date()
    private var firstWeekdayDate: Date {
        get {
            currentDate.next(.monday, direction: .backward, considerToday: true)
        }
    }
    private var selectedDate: Date {
        didSet {
            reloadData()
        }
    }
    
    public var weekCalendarDelegate: PBWeekCalendarDelegate?
    
    public init(frame: CGRect, currentDate: Date, selectedDate: Date? = nil, delegate: PBWeekCalendarDelegate? = nil) {
        self.currentDate = currentDate
        self.selectedDate = selectedDate ?? currentDate
        self.weekCalendarDelegate = delegate
        super.init(frame: frame, collectionViewLayout: weekCalendarLayout)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        self.selectedDate = Date()
        super.init(coder: coder)
        collectionViewLayout = weekCalendarLayout
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
        isPagingEnabled = true
        
        registerCells()
    }
    
    private func registerCells() {
        register(cellIdentifier: WeekDayCell.defaultReuseIdentifier)
    }
    
    public func setup(currentDate: Date, selectedDate: Date? = nil, delegate: PBWeekCalendarDelegate? = nil) {
        self.currentDate = currentDate
        self.selectedDate = selectedDate ?? currentDate
        self.weekCalendarDelegate = delegate
    }
    
    private func getDate(forIndexPath indexPath: IndexPath) -> Date {
        do {
            return try firstWeekdayDate.addingDays(days: indexPath.row)
        } catch {
            return Date()
        }
    }
}

extension PBWeekCalendarCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = getDate(forIndexPath: indexPath)
        weekCalendarDelegate?.didSelect(date: selectedDate)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width / 7, height: collectionView.height)
    }
}

extension PBWeekCalendarCollectionView: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WeekDayCell = collectionView.dequeueCell(cellType: WeekDayCell.self, indexPath: indexPath)
        
        let date = getDate(forIndexPath: indexPath)
        let dayLiteralString = date.daySymbolString
        let dayNumberString = date.dayString
        let isSelectedDate: Bool = selectedDate.isSameDay(than: date)
        let weekDayCellData = WeekDayCellData(dayLiteralString: dayLiteralString,
                                              dayNumberString: dayNumberString,
                                              isSelected: isSelectedDate,
                                              isToday: date.isToday)
        cell.setup(cellData: weekDayCellData)
        
        return cell
    }
}
