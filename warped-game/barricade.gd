extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func deactivate():
	$TileMapLayer.collision_enabled = false
	var tween = get_tree().create_tween()
	tween.tween_property($TileMapLayer, "modulate", Color(0.902, 0.902, 0.8, 0.498), 0.5)
	
func reactivate():
	$TileMapLayer.collision_enabled = true
	var tween = get_tree().create_tween()
	tween.tween_property($TileMapLayer, "modulate", Color(0, 0.5, 0.5), 0.5)
	
