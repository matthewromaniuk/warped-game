extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/Timer.start(400)
	$GUI/Timer/Time.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
