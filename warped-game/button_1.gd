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
	
func check_button() -> void:
	if entered and stick:
		$AnimatedSprite2D/AnimatedSprite2D.frame = 0
		entered = false
		get_parent().get_node("barricade1").reactivate()
	else:
		$AnimatedSprite2D/AnimatedSprite2D.frame = 1
		entered = true
		get_parent().get_node("barricade1").deactivate()
