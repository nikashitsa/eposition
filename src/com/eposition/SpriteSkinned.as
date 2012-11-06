package com.eposition 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author nikashitsa
	 */
	public class SpriteSkinned extends Sprite 
	{
		
		public function SpriteSkinned(skinClass:Class) 
		{
			var bitmap:Bitmap = new skinClass();
			addChild(bitmap);
		}
		
	}

}