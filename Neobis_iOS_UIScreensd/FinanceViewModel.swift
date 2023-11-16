//
//  FinanceViewModel.swift
//  Neobis_iOS_UIScreensd
//
//  Created by Interlink on 20/11/23.
//


import Foundation

class FinanceViewModel {
    private(set) var currentDateIndex: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: Notification.Name("CurrentDateIndexChanged"), object: nil)
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }()

    func updateDate() {
        let currentDate = Calendar.current.date(byAdding: .day, value: currentDateIndex, to: Date()) ?? Date()
        let dateString = dateFormatter.string(from: currentDate)
        NotificationCenter.default.post(name: Notification.Name("DateUpdated"), object: dateString)
    }

    func backButtonTapped() {
        currentDateIndex -= 1
        updateDate()
        NotificationCenter.default.post(name: Notification.Name("BackButtonTapped"), object: nil)
    }

    func forwardButtonTapped() {
        currentDateIndex += 1
        updateDate()
        NotificationCenter.default.post(name: Notification.Name("ForwardButtonTapped"), object: nil)
    }

    func setFontSize(_ size: CGFloat) {
        NotificationCenter.default.post(name: Notification.Name("FontSizeChanged"), object: size)
    }
}
