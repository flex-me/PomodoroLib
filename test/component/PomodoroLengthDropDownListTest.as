package component
{
	import mx.events.FlexEvent;
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
	public class PomodoroLengthDropDownListTest
	{		
		
		private var pomodoroLengthDropDownList:PomodoroLengthDropDownList;
		
		[Before(async, ui)]
		public function setUp():void
		{
			pomodoroLengthDropDownList = new PomodoroLengthDropDownList();
			Async.proceedOnEvent(this, pomodoroLengthDropDownList, FlexEvent.CREATION_COMPLETE, 1000);
			UIImpersonator.addChild(pomodoroLengthDropDownList);
		}
		
		[After]
		public function tearDown():void
		{
			UIImpersonator.removeChild(pomodoroLengthDropDownList);
			pomodoroLengthDropDownList = null;
		}
		
		[Test]
		public function testGetPomodoroLength():void
		{
			Assert.assertEquals(PomodoroLengthDropDownList.POMODORO_LENGTH_25MINUTES, pomodoroLengthDropDownList.getPomodoroLength());
		}
	}
}