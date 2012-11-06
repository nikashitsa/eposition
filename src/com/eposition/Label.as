package com.eposition 
{
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author nikashitsa
	 */
	public class Label extends TextField 
	{		
		[Embed(source = "font/JAi_____.TTF", fontName='JackInput', advancedAntiAliasing='true', embedAsCFF = 'false', mimeType="application/x-font")]
		private var fontClass:Class;	
		
		public function Label() 
		{			
			var font:Font = new fontClass();
			var tf:TextFormat = new TextFormat(font.fontName, 12);
			
			autoSize = TextFieldAutoSize.LEFT;
			
			background = true;
			backgroundColor = 0xffffff;
			
			y = 4;
			x = 30;
			
			defaultTextFormat = tf;
			
		}		
		
	}

}