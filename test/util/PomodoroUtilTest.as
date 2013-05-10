package util
{
	import component.PomodoroLengthDropDownList;
	
	import org.flexunit.Assert;

	public class PomodoroUtilTest
	{		
		[Test]
		public function getTodayWithYearMonthDateOnly():void{
			var now:Date = new Date();
			var today:Date = PomodoroUtil.getTodayWithYearMonthDateOnly();
			Assert.assertEquals(now.fullYear, today.fullYear);
			Assert.assertEquals(now.month, today.month);
			Assert.assertEquals(now.date, today.date);
			Assert.assertEquals(0, today.hours);
			Assert.assertEquals(0, today.minutes);
			Assert.assertEquals(0, today.seconds);
		}
		
		[Test]
		public function testDateToTimeString():void{
			var date:Date = new Date(2012, 6, 13, 9, 10, 25);
			var timeText:String = PomodoroUtil.dateToTimeString(date);
			Assert.assertEquals("09:10:25", timeText);
		}
		
		[Test]
		public function testFormatTimeDigit():void{
			Assert.assertEquals("02", PomodoroUtil.formatTimeDigit(2));
			Assert.assertEquals("09", PomodoroUtil.formatTimeDigit(9));
		}
		
		[Test(expected="Error")]
		public function testFormatTimeDigitWithInvalidNumber():void{
			PomodoroUtil.formatTimeDigit(999);
		}
		
		[Test]
		public function testIsTimeUp():void{
			Assert.assertTrue(PomodoroUtil.isTimeUp(new Date(2012, 3, 10, 3, 25, 0), PomodoroLengthDropDownList.POMODORO_LENGTH_25MINUTES));
			Assert.assertTrue(PomodoroUtil.isTimeUp(new Date(2012, 3, 10, 1, 2, 0), PomodoroLengthDropDownList.POMODORO_LENGTH_25MINUTES));
			Assert.assertFalse(PomodoroUtil.isTimeUp(new Date(2012, 3, 10, 0, 2, 0), PomodoroLengthDropDownList.POMODORO_LENGTH_25MINUTES));
		
			Assert.assertTrue(PomodoroUtil.isTimeUp(new Date(2012, 3, 10, 0, 0, 3), PomodoroLengthDropDownList.POMODORO_LENGTH_3Seconds));
			Assert.assertFalse(PomodoroUtil.isTimeUp(new Date(2012, 3, 10, 0, 0, 2), PomodoroLengthDropDownList.POMODORO_LENGTH_3Seconds));
		}
		
		public static const expectedFullString:String = "2012-07-05, 21:00:00, 星期四";
		[Test]
		public function testDateToFullString():void{
			var date:Date = new Date(2012, 6, 5, 21, 0, 0);
			Assert.assertEquals(expectedFullString, PomodoroUtil.dateToFullString(date));
		}
		
		[Test]
		public function testToYearMonthDateString():void{
			var date:Date = new Date(2012, 6, 5, 21, 0, 0);
			Assert.assertEquals("2012-07-05", PomodoroUtil.toYearMonthDateString(date));
		}
		
		[Test]
		public function testToDayText():void{
			Assert.assertEquals("星期日", PomodoroUtil.toDayText(new Date(2012, 6, 1, 21, 0, 0)));
			Assert.assertEquals("星期一", PomodoroUtil.toDayText(new Date(2012, 6, 2, 21, 0, 0)));
			Assert.assertEquals("星期二", PomodoroUtil.toDayText(new Date(2012, 6, 3, 21, 0, 0)));
			Assert.assertEquals("星期三", PomodoroUtil.toDayText(new Date(2012, 6, 4, 21, 0, 0)));
			Assert.assertEquals("星期四", PomodoroUtil.toDayText(new Date(2012, 6, 5, 21, 0, 0)));
			Assert.assertEquals("星期五", PomodoroUtil.toDayText(new Date(2012, 6, 6, 21, 0, 0)));
			Assert.assertEquals("星期六", PomodoroUtil.toDayText(new Date(2012, 6, 7, 21, 0, 0)));
		}
	}
}