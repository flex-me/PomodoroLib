package util
{
	public class PomodoroUtil{
		
		public static function isTimeUp(timeModel:Date, pormodoroLength:Number):Boolean{
			var totalSeconds:Number = timeModel.hours * 3600 + timeModel.minutes * 60 + timeModel.seconds;
			return totalSeconds >= pormodoroLength;
		}
		
		public static function getTodayWithYearMonthDateOnly():Date{
			var now:Date = new Date();
			var today:Date = new Date(now.fullYear, now.month, now.date);
			return today;
		}
		
		public static function dateToTimeString(date:Date):String{
			return formatTimeDigit(date.hours) 
				+ ":" 
				+ formatTimeDigit(date.minutes) 
				+ ":" 
				+ formatTimeDigit(date.seconds);
		}
		
		public static function formatTimeDigit(digit:Number):String{
			var digitString:String = String(digit);
			if(digitString.length == 1){
				return "0" + digitString;
			}
			if(digitString.length == 2){
				return digitString;
			}
			throw(new Error("Number not valid. "));
		}
		
		public static function toYearMonthDateString(date:Date):String{
			var result:String = "";
			result += date.fullYear;
			result += "-";
			result += formatTimeDigit(date.month + 1);
			result += "-";
			result += formatTimeDigit(date.date);
			return result;
		}
		
		public static function dateToFullString(date:Date):String{
			var result:String = "";
			result += toYearMonthDateString(date);
			result += ", ";
			result += dateToTimeString(date);
			result += ", ";
			result += toDayText(date);
			return result;
		}
		
		public static function toDayText(date:Date):String{
			if(date.day == 0) return "星期日";
			if(date.day == 1) return "星期一";
			if(date.day == 2) return "星期二";
			if(date.day == 3) return "星期三";
			if(date.day == 4) return "星期四";
			if(date.day == 5) return "星期五";
			if(date.day == 6) return "星期六";
			return "";
		}
	}
}