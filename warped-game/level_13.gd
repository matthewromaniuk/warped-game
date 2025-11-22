extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GUI/Timer.start(5)
	get_node("button1").stick = true
	get_node("button2").stick = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
