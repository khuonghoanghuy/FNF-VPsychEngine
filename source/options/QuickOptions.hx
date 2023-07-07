package options;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;

using StringTools;

class QuickOptions extends BaseOptionsMenu
{
    public function new()
    {
        super();

        title = 'Quick Setting';
		rpcTitle = 'Quick Setting Menu'; //for Discord Rich Presence

		var option:Option = new Option('Ghost Tapping',
			"If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
			'ghostTapping',
			'bool',
			true);
		addOption(option);

        var option:Option = new Option('Downscroll', //Name
            'If checked, notes go Down instead of Up, simple enough.', //Description
            'downScroll', //Save data variable name
            'bool', //Variable type
            false); //Default value
        addOption(option);
    }

    var changedMusic:Bool = false;
	function onChangePauseMusic()
	{
		if(ClientPrefs.pauseMusic == 'None')
			FlxG.sound.music.volume = 0;
		else
			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)));

		changedMusic = true;
	}

	override function destroy()
	{
		if(changedMusic) FlxG.sound.playMusic(Paths.music('freakyMenu'));
		super.destroy();
	}
}