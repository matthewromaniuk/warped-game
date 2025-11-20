extends Node

var cooldown := 0
var player1_portal 
var player2_portal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if cooldown:
		cooldown -= 1

func check_portals() -> void:
	if !get_parent().get_node("player1").portal:
		pass
	elif get_parent().get_node("player1").portal == get_parent().get_node("player2").portal and !cooldown:
		var temp = get_parent().get_node("player1").position
		get_parent().get_node("player1").portal_animation()
		get_parent().get_node("player2").portal_animation()
		await get_tree().create_timer(1).timeout
		get_parent().get_node("player1").position = get_parent().get_node("player2").position
		get_parent().get_node("player2").position = temp
		cooldown = 60

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
		var portal
		if player == 1:
			portal = player1_portal
		else:
			portal = player2_portal
		var tween = get_tree().create_tween()
		tween.set_parallel(true)
		get_parent().get_node("Portal " + portal + " 1").get_child(0).stop()
		tween.tween_property(get_parent().get_node("Portal " + portal + " 1"),"modulate", Color(1,1,1), 0.2)
		get_parent().get_node("Portal " + portal + " 2").get_child(0).stop()
		tween.tween_property(get_parent().get_node("Portal " + portal + " 2"),"modulate", Color(1,1,1), 0.2)
