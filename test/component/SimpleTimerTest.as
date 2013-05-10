package component
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	
	import util.UsefulSentence;

	public class SimpleTimerTest
	{
		private var simpleTimer:SimpleTimer;
		
		[Before]
		public function setUp():void
		{
			simpleTimer = new SimpleTimer();
		}
		
		[After]
		public function tearDown():void
		{
			simpleTimer = null;
		}
		
		[Test(async)]
		public function testRestartTimer():void{
			var asyncHandler:Function = Async.asyncHandler( this, handleTimerComplete, 1500, null, handleTimeout );
			simpleTimer.addEventListener(TimerEvent.TIMER, asyncHandler);
			simpleTimer.restartTimer();
		}
		
		protected function handleTimerComplete(event:TimerEvent, passThroughData:Object):void{
			var tempSimpleTimer:SimpleTimer = event.target as SimpleTimer;
			var timer:Timer = tempSimpleTimer.getTimer();
			Assert.assertEquals(1, timer.currentCount);
			Assert.assertEquals(1000, timer.delay);
		}
		
		protected function handleTimeout(passThroughData:Object):void{
			Assert.fail(UsefulSentence.TIMEOUT_SHOULD_NOT_REACH_HERE);
		}
	}
}


















