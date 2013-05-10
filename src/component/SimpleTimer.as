package component
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class SimpleTimer extends EventDispatcher
	{
		private var timer:Timer = new Timer(1000);
		
		public function SimpleTimer(){
			timer.addEventListener(TimerEvent.TIMER, onTimerEvent);
		}
		
		private function onTimerEvent(timerEvent:TimerEvent):void{
			this.dispatchEvent(timerEvent);
		}
		
		public function restartTimer():void{
			timer.reset();
			timer.start();
		}
		
		public function getTimer():Timer{
			return timer;
		}
	}
}