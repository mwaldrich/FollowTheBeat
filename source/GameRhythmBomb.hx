package;

class GameRhythmBomb extends AGameHazard {
	
	private var rhythmBomb:RhythmBomb;
	private var rhythmBombSprite:GameRhythmBombSprite;

	public function new(rhythmBomb:RhythmBomb) {
		super();

		this.rhythmBomb = rhythmBomb;
		this.rhythmBombSprite = new GameRhythmBombSprite(rhythmBomb.getLocation().x, rhythmBomb.getLocation().y);
	}

	public override function getHazard():IHazard {
		return this.rhythmBomb;
	}

	public override function beat(newBeat:Int):Void {
		if (this.rhythmBomb.isExploding(newBeat)) {
			rhythmBombSprite.activate(newBeat);
		} else {
			rhythmBombSprite.deactivate(newBeat);
		}
	}

	public override function getPieces():Array<AGameSprite> {
		return [rhythmBombSprite];
	}
}