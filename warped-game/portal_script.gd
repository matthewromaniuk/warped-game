extends Node

var cooldown := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cooldown -= 1

func check_portals() -> void:
	if get_parent().get_node("player1").portal == get_parent().get_node("player2").portal and cooldown <= 0:
		var temp = get_parent().get_node("player1").position
		get_parent().get_node("player1").portal_animation()
		get_parent().get_node("player2").portal_animation()
		await get_tree().create_timer(1).timeout
		get_parent().get_node("player1").position = get_parent().get_node("player2").position
		get_parent().get_node("player2").position = temp
		get_parent().get_node("player1").portal = "1"
		get_parent().get_node("player1").portal = "2"
		cooldown = 60
