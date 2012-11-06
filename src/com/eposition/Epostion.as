package com.eposition 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author nikashitsa
	 */
	public class Epostion extends Sprite 
	{
		private var _stage:Stage;
		private var control:Control;	
		
		private var front:Sprite;
		
		public function Epostion(stage:Stage) 
		{
			this._stage = stage;
			
			control = new Control();				
			front = new Sprite();			
			front.mouseEnabled = false;
		
			_stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);			
			_stage.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_stage.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}	
		
		private function onMouseOut(e:MouseEvent):void 
		{				
			front.visible = false;			
		}
		
		private function onMouseOver(e:MouseEvent):void 
		{
			var sp:Sprite = e.target as Sprite;	
			if (sp == null) return;			
			
			if (sp.parent != control && sp!=control) {	
				front.visible = true;
				
				front.graphics.clear();				
				front.graphics.beginFill(0x00ff00, 0.3);
				front.graphics.drawRect(0, 0, sp.width, sp.height);
				front.graphics.endFill();
				
				sp.addChild(front);
			}
		}	
		
		private function onMouseDown(e:MouseEvent):void 
		{				
			if (e.ctrlKey) return;
			
			var sp:Sprite = e.target as Sprite;	
			if (sp == null) return;			
			
			if (sp.name == 'eposition') {					
				sp.parent.removeChild(sp);
				_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				return;
			}
			
			if (sp.getChildByName('eposition') == null && sp.parent != control) {				
				front.visible = false;
				control.setup(sp);				
				_stage.addChild(control);		
				_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			}			
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{		
			switch (e.keyCode) 
			{
				case 37:
					//left
					control.moveObject( -1, 0, e.shiftKey);
				break;
				case 38:
					//up
					control.moveObject(0, -1, e.shiftKey);
				break;
				case 39:
					//right
					control.moveObject(1, 0, e.shiftKey);
				break;
				case 40:
					//down
					control.moveObject(0, 1, e.shiftKey);
				break;
			}
		}	
	}

}