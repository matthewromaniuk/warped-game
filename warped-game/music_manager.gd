extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play():
	$Music.play()

func fade():
	var tween = get_tree().create_tween()
	tween.tween_property($Music, "volume_db", -80, 2)
