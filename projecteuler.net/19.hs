
isleap year = year `mod` 4 == 0 && year `mod` 100 /= 0 || year `mod` 400 == 0

daysInMonth year month 
	| month == 2 = if isleap year then [1..29] else [1..28]
	| month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 = [1..31]
	| otherwise = [1..30]

days = [(year, month, day) | year <- [1900..2000], month <- [1..12], day <- daysInMonth year month]

problem_19 = length [(year,month,day) | (x,(year,month,day)) <- zip (cycle [1..7]) days, x == 7 && year >= 1901 && day == 1]