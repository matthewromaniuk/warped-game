extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/Timer.start(2.4)
	if global.hard:
		$player1.position = Vector2(24,83)
		$player2.position = Vector2(184,82)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
