extends Node

var player1_portal 
var player2_portal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func check_portals() -> void:
	if !get_parent().get_node("player1").portal:
		pass
	elif get_parent().get_node("player1").portal == get_parent().get_node("player2").portal:
		get_parent().get_node("player1").portal_animation()
		get_parent().get_node("player2").portal_animation()
		await get_tree().create_timer(1).timeout
		if !global.failed:
			global.level += 1
			get_tree().change_scene_to_file("res://level"+str(global.level)+".tscn")
		else:
			get_tree().change_scene_to_file("res://level1.tscn")
			global.failed = false

func player_in_portal() -> bool:
	var player_present = false
	if get_parent().get_node("player1").portal or get_parent().get_node("player2").portal:
		player_present = true
	return player_present

func light_portals(player : int ,portal : String):
	if player == 1:
		player1_portal = portal
	else:
		player2_portal = portal
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	get_parent().get_node("Portal " + portal + " 1").get_child(0).play()
	tween.tween_property(get_parent().get_node("Portal " + portal + " 1"),"modulate", get_parent().get_node("Portal " + portal + " 1").portal_colour, 0.2)
	get_parent().get_node("Portal " + portal + " 2").get_child(0).play()
	tween.tween_property(get_parent().get_node("Portal " + portal + " 2"),"modulate", get_parent().get_node("Portal " + portal + " 1").portal_colour, 0.2)

func unlight_portals(player : int):
	if !player_in_portal():
		print("you shouldnt be reading thiss")
