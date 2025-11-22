extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/Timer.start(2.6)
	if global.hard:
		$player2.position = Vector2(50,114)
		$player1.position = Vector2(161,115)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
