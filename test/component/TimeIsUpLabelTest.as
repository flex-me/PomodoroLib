package component
{
	import mx.events.FlexEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
	public class TimeIsUpLabelTest
	{		
		private var timeIsUpLabel:TimeIsUpLabel;
		
		[Before(async, ui)]
		public function setUp():void
		{
			timeIsUpLabel = new TimeIsUpLabel();
			Async.proceedOnEvent(this, timeIsUpLabel, FlexEvent.CREATION_COMPLETE, 1000);
			UIImpersonator.addChild(timeIsUpLabel);
		}
		
		[After]
		public function tearDown():void
		{
			UIImpersonator.removeChild(timeIsUpLabel);
			timeIsUpLabel = null;
		}
		
		[Test]
		public function testDefaultVisible():void{
			Assert.assertFalse(timeIsUpLabel.visible);
		}
		
		[Test]
		public function testShow():void
		{
			timeIsUpLabel.show();
			Assert.assertTrue(timeIsUpLabel.visible);
		}
		
		[Test]
		public function testHide():void
		{
			timeIsUpLabel.hide();
			Assert.assertFalse(timeIsUpLabel.visible);
		}
	}
}