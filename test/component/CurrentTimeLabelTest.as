package component
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.events.FlexEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
	import util.PomodoroUtilTest;
	import util.UsefulSentence;

	public class CurrentTimeLabelTest
	{		
		private var currentTimeLabel:CurrentTimeLabel;
		
		[Before(async, ui)]
		public function setUp():void
		{
			currentTimeLabel = new CurrentTimeLabel();
			Async.proceedOnEvent(this, currentTimeLabel, FlexEvent.CREATION_COMPLETE, 500);
			UIImpersonator.addChild(currentTimeLabel);
		}
		
		[After]
		public function tearDown():void
		{
			UIImpersonator.removeChild(currentTimeLabel);
			currentTimeLabel = null;
		}
		
		[Test(async, ui)]
		public function testCatchTimerEvent():void{
			var asyncHandler:Function = Async.asyncHandler(this, handleTimerComplete, 1500, null, handleTimeout);
			currentTimeLabel.addEventListener(TimerEvent.TIMER, asyncHandler);
		}

		protected function handleTimerComplete(event:TimerEvent, passThroughData:Object):void{
			var tempCurrentTimerLabel:CurrentTimeLabel = event.target as CurrentTimeLabel;
			Assert.assertEquals(PomodoroUtilTest.expectedFullString.length, tempCurrentTimerLabel.currentTimeText.length);
			var timer:Timer = tempCurrentTimerLabel.getTimer();
			Assert.assertEquals(1, timer.currentCount);
			Assert.assertEquals(1000, timer.delay);
		}
		
		protected function handleTimeout(passThroughData:Object):void{
			Assert.fail(UsefulSentence.TIMEOUT_SHOULD_NOT_REACH_HERE);
		}
	}
}