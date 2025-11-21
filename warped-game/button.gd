extends Area2D

@export var button_name := "Default"
var entered := false
var stick := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func check_buttons() -> void:
	if entered and stick:
		$button/AnimatedSprite2D/AnimatedSprite2D.frame = 0
		get_parent().get_node("barricade").reactivate()
	else:
		$button/AnimatedSprite2D/AnimatedSprite2D.frame = 1
		get_parent().get_node("barricade").deactivate()
