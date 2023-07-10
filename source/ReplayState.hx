package;

import flixel.FlxG;
import PlayState;
import flixel.FlxSprite;

// this states is powerful
// still very w.i.p
class ReplayState extends MusicBeatState
{
    var replayFrom:PlayState;

    override function create()
    {
        super.create();

        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.scrollFactor.set();
		add(bg);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (controls.BACK)
            MusicBeatState.switchState(new MainMenuState());
    }
}