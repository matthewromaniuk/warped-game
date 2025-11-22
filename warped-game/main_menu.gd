extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_check_button_toggled(toggled_on: bool) -> void:
	global.hard = toggled_on


func _on_play_pressed() -> void:
	global.level = 1
	get_tree().change_scene_to_file("res://level1.tscn")


func _on_tut_pressed() -> void:
	global.level = -1
	get_tree().change_scene_to_file("res://level-1.tscn")
