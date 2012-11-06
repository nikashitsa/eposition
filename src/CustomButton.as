package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author nikashitsa
	 */
	public class CustomButton extends Sprite 
	{
		private var up_bm:Bitmap;
		private var over_bm:Bitmap;
		private var clickFunction:Function;
		
		public function CustomButton(clickFunction:Function, upSkin:Class, overSkin:Class=null) 
		{
			this.clickFunction = clickFunction;
			up_bm = new upSkin();				
			
			this.tabEnabled = false;			
			buttonMode = true;			
			
			addEventListener(MouseEvent.CLICK, function():void { clickFunction(); } );
			addChild(up_bm);	
			
			if (overSkin) {
				over_bm = new overSkin();
				over_bm.visible = false;
				addEventListener(MouseEvent.MOUSE_OVER, mouseOverListener);
				addEventListener(MouseEvent.MOUSE_OUT, mouseOutListener);
				addChild(over_bm);
			}
		}
		
		private function mouseOverListener(e:MouseEvent):void {
			up_bm.visible = false;
			over_bm.visible = true;
		}
		private function mouseOutListener(e:MouseEvent):void {
			over_bm.visible = false;
			up_bm.visible = true;			
		}		
		
	}

}