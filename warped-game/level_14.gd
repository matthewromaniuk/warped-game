extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.boss = true
	$GUI/Timer.start(30)
	MusicManager.fade()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_death_area_entered(area: Area2D) -> void:
	if area.name == "Area2D":
		get_tree().change_scene_to_file("res://level14.tscn")
