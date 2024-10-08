//
//  DayPadCell.swift
//  KVKCalendar
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

final class DayPadCell: DayCell {
    var padStyle: Style? {
        didSet {
            guard let newStyle = padStyle else { return }
            
            style = newStyle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.textAlignment = .right
        dateLabel.textAlignment = .center
        
        var titleFrame = frame
        titleFrame.origin = .zero
        titleFrame.size.width = frame.width * 0.49
        titleLabel.frame = titleFrame
        
        var dateFrame = frame
        dateFrame.size.width = heightDate
        dateFrame.size.height = frame.height > heightDate ? heightDate : frame.height / 2
        dateFrame.origin.y = titleLabel.center.y - (dateFrame.size.height * 0.5)
        dateFrame.origin.x = (frame.width * 0.5) + style.week.spaceBetweenDayTiteAndDate
        dotView.frame = dateFrame
        dateLabel.frame = CGRect(origin: .zero, size: dateFrame.size)
        
        contentView.addSubview(dotView)
        contentView.addSubview(titleLabel)
        dotView.addSubview(dateLabel)
        if let radius = style.headerScroll.dotCornersRadius {
            dotView.setRoundCorners(style.headerScroll.dotCorners, radius: radius)
        } else {
            let value = dotView.frame.width / 2
            dotView.setRoundCorners(style.headerScroll.dotCorners, radius: CGSize(width: value, height: value))
        }
        eventIndecatorView.frame = CGRect(origin: CGPoint(x: dotView.center.x - style.week.spaceBetweenDayTiteAndDate, y: dateFrame.origin.y + heightDate + 3), size: style.week.eventIndicatorSize)
        
        contentView.addSubview(eventIndecatorView)
        let radiusForEventIndicator = eventIndecatorView.frame.width / 2
        eventIndecatorView.setRoundCorners(radius: CGSize(width: radiusForEventIndicator, height: radiusForEventIndicator))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
