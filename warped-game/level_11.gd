extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/Timer.start(4.5)
	if global.hard:
		$player2.position = Vector2(-32,27)
		$player1.position = Vector2(241,63)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
