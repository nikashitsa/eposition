package com.eposition 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.System;
	
	/**
	 * ...
	 * @author nikashitsa
	 */
	public class Control extends Sprite 
	{
		private var object:Sprite;
		private var zeroPoint:Point;
		
		private var bg:Sprite;
		
		[Embed(source="img/icon_move.png")]
		private var dragSkin:Class;
		private var dragIcon:SpriteSkinned;
			
		private var label:Label;
		
		public function Control() 
		{						
			name = 'eposition';
			
			zeroPoint = new Point(0, 0);
			
			bg = new Sprite();			
			bg.mouseEnabled = false;
			
			dragIcon = new SpriteSkinned(dragSkin);		
			
			label = new Label();
			
			addChild(bg);
			addChild(dragIcon);
			addChild(label);		
			
			dragIcon.buttonMode = true;
			dragIcon.tabEnabled = false;
			dragIcon.addEventListener(MouseEvent.MOUSE_DOWN, dragIconDown);
			dragIcon.addEventListener(MouseEvent.MOUSE_UP, dragIconUp);				
		}
		
		public function setup(object:Sprite):void {
			this.object = object;	
			
			bg.graphics.clear();			
			bg.graphics.beginFill(0xffffff, 0.3);		
			bg.graphics.drawRect(0, 0, object.width, object.height);
			bg.graphics.endFill();
			
			moveToObject();			
		}
		
		private function dragIconUp(e:MouseEvent):void 
		{
			object.stopDrag();		
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function dragIconDown(e:MouseEvent):void 
		{
			object.startDrag();	
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);			
		}
		
		private function onMouseMove(e:MouseEvent):void 
		{
			moveToObject();
		}
		
		public function moveObject(_x:Number, _y:Number, shift:Boolean):void {
			object.x += _x * (shift ? 10 : 1);
			object.y += _y * (shift ? 10 : 1);		
			
			moveToObject();	
		}
		
		private function moveToObject():void {
			var point:Point = object.localToGlobal(zeroPoint);			
			x = point.x;
			y = point.y;			
			label.text = 'x: ' + object.x + ', y: ' + object.y;
		}
		
	}

}