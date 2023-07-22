package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;
	public static var exWarm:Bool = false;

	var warnText:FlxText;
	var str:String;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		if (exWarm) {
			str = "Yo, i think you using a in-develop version of VPsych Engine\nThis source may contains bug of stuff can crash game!\nPress Enter to move to release page to download a stable version\nPress ESCAPE to continue playing in-develop version";
		} else {
			str = "Yo, i think you using a old version of VPsych Engine\nPlease update if you need!\nPress Enter to move to release page\nPress ESCAPE to continue playing";
		}

		warnText = new FlxText(0, 0, FlxG.width, str, 32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/khuonghoanghuy/FNF-VPsychEngine/releases");
			}
			else if(controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
