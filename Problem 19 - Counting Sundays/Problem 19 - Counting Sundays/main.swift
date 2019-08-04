//
//  main.swift
//  Problem 19 - Counting Sundays
//
//  Created by Jaakko Kenttä on 19/07/2019.
//  Copyright © 2019 com.jaakkokentta. All rights reserved.
//

import Foundation

/*
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/

let calendar = Calendar.current

//let formatter = DateFormatter()
//formatter.doesRelativeDateFormatting = true
//formatter.dateStyle = .short
//formatter.timeStyle = .none

func getAll(days: Int, between startDate: Date, and endDate: Date) -> [Date] {

	let calendar = Calendar.current
	let dayComponent = DateComponents(weekday: days)
	var sundays = [Date]()

	calendar.enumerateDates(startingAfter: startDate, matching: dayComponent, matchingPolicy: .nextTime) { (date, strict, stop) in
		guard let date = date else { return }

		if date <= endDate {
			sundays.append(date)
		} else {
			stop = true
		}
	}
	return sundays
}

let startDateComponents = DateComponents(calendar: calendar, year: 1901, month: 1, day: 1)
let startDate = calendar.date(from: startDateComponents)!

let endDateComponents = DateComponents(calendar: calendar, year: 2000, month: 12, day: 31)
let endDate = calendar.date(from: endDateComponents)!

let allSundays = getAll(days: 1, between: startDate, and: endDate)

var allFirstDatesSundays = 0
for sunday in allSundays {
	let weekday = calendar.component(.day, from: sunday)
	if weekday == 1 {
		allFirstDatesSundays += 1
	}
}

print(allFirstDatesSundays)

/*
var numberOfSundays = 0
let components = DateComponents(day: 1) // Match only dates with first of the month

calendar.enumerateDates(startingAfter: startDate, matching: components, matchingPolicy: .nextTime) { (date, strict, stop) in
	guard let date = date else { return }

	if date <= endDate {
		let weekDay = calendar.component(.weekday, from: date)
		if weekDay == 1 {
			numberOfSundays += 1
		}
	} else {
		stop = true
	}
}

print(numberOfSundays)
*/
