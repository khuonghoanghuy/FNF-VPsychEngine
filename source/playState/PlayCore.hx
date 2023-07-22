package playState;

class PlayCore 
{
    public static function getScore(score:Int, misses:Int, accuracy:Float, rating:String, percent:Float, ratingFC:String) {
        return PlayState.instance.scoreTxt.text = 'Score: ' + score
		+ ' | Misses: ' + misses
		+ ' | Rating: ' + accuracy
		+ (rating != '?' ? ' (${Highscore.floorDecimal(percent * 100, 2)}%) - $ratingFC' : '');
    }
}