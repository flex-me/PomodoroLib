package util
{
	import org.flexunit.Assert;

	public class TestString
	{		
		[Test]
		public function testNumberToString():void{
			Assert.assertEquals("123", String(123));
			Assert.assertEquals("123", new String(123));
		}
	}
}