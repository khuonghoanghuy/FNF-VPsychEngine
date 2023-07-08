package editors;

import openfl.net.FileReference;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUIInputText;
import flixel.ui.FlxButton;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import haxe.Json;

// a state allows u coding lua or text inside the game, wow!
class CodePad extends MusicBeatState
{
  var _file:FileReference;

  var str:String = "write code";
  var saveFile:FlxButton;
  var partInput:FlxUIInputText;
  
  override function create()
  {
    super.create();

    addButton();
  }

  function addButton()
  {
    saveFile = new FlxButton(FlxG.width - 400, 25, "Save", saveFileStuff);
    add(saveFile);
  }

  function saveFileStuff()
  {
    var jsonCode = str;

    var data:String = Json.stringify(jsonCode, "\t");

    if (data.length > 0)
    {
      _file = new FileReference();
      _file.addEventListener(Event.COMPLETE, onSaveComplete);
      _file.addEventListener(Event.CANCEL, onSaveCancel);
      _file.addEventListener(IOErrorEvent.IO_ERROR, onSaveError);
      _file.save(jsonCode + ".json");
    }
  }s

  override function update(elapsed:Float)
  {
    super.update(elapsed);

    if (controls.BACK) {
      FlxG.switchState(new MasterEditorMenu());
    }
  }

  function onSaveComplete(_):Void
    {
        _file.removeEventListener(Event.COMPLETE, onSaveComplete);
        _file.removeEventListener(Event.CANCEL, onSaveCancel);
        _file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
        _file = null;
        FlxG.log.notice("Successfully saved LEVEL DATA.");
    }

    /**
     * Called when the save file dialog is cancelled.
     */
    function onSaveCancel(_):Void
    {
        _file.removeEventListener(Event.COMPLETE, onSaveComplete);
        _file.removeEventListener(Event.CANCEL, onSaveCancel);
        _file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
        _file = null;
    }

    /**
     * Called if there is an error while saving the gameplay recording.
     */
    function onSaveError(_):Void
    {
        _file.removeEventListener(Event.COMPLETE, onSaveComplete);
        _file.removeEventListener(Event.CANCEL, onSaveCancel);
        _file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
        _file = null;
        FlxG.log.error("Problem saving Level data");
    }
}
