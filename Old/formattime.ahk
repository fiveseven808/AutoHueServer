FormatTime, TimeString
MsgBox The current time and date (time first) is %TimeString%.

FormatTime, TimeString, R
MsgBox The current time and date (date first) is %TimeString%.

FormatTime, TimeString,, Time
MsgBox The current time is %TimeString%.

FormatTime, TimeString, T12, Time
MsgBox The current 24-hour time is %TimeString%.

FormatTime, TimeString,, LongDate
MsgBox The current date (long format) is %TimeString%.

FormatTime, TimeString, 20050423220133, dddd MMMM d, yyyy hh:mm:ss tt
MsgBox The specified date and time, when formatted, is %TimeString%.

FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
MsgBox %TimeString%

FormatTime, YearWeek, 20050101, YWeek
MsgBox January 1st of 2005 is in the following ISO year and week number: %YearWeek%