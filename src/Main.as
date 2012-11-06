package 
{
	import com.eposition.Epostion;
	import com.eposition.SpriteSkinned;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author nikashitsa
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "../img/beach.jpg")]
		private var bgSkin:Class;	
		private var bgSprite:SpriteSkinned;
		
		[Embed(source = "../img/player.png")]
		private var playerSkin:Class;		
		private var playerSprite:SpriteSkinned;		
		
		[Embed(source = "../img/computer.png")]
		private var computerSkin:Class;
		private var computerSprite:SpriteSkinned;
		
		[Embed(source = "../img/net.jpg")]
		private var netSkin:Class;
		private var netSprite:SpriteSkinned;
		
		[Embed(source = "../img/button_up.jpg")]
		private var buttonUpSkin:Class;		
		[Embed(source = "../img/button_over.jpg")]
		private var buttonOverSkin:Class;
		private var button:CustomButton;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
				
			bgSprite = new SpriteSkinned(bgSkin);	
			bgSprite.y = 62;
			
			playerSprite = new SpriteSkinned(playerSkin);			
			computerSprite = new SpriteSkinned(computerSkin);
			netSprite = new SpriteSkinned(netSkin);
			
			button = new CustomButton(buttonClick, buttonUpSkin, buttonOverSkin);
			
			addChild(bgSprite);		
			
			bgSprite.addChild(playerSprite);	
			bgSprite.addChild(computerSprite);
			bgSprite.addChild(netSprite);
			bgSprite.addChild(button);
			
			//initialization Eposition
			var em:Epostion = new Epostion(stage);
			
		}
		
		private function buttonClick():void 
		{
			playerSprite.visible = !playerSprite.visible;
			computerSprite.visible = !computerSprite.visible;
		}
		
	}
	
}