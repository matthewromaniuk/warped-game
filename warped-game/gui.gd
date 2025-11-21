extends CanvasLayer

@onready var timer = $Timer

func _process(_delta: float) -> void:
	if !$Timer.is_stopped():
		if $Timer.time_left < 3:
			$Timer/Time.modulate = Color(1,0,0)
			$Timer/Time.text = str($Timer.time_left).substr(0,4)
		elif $Timer.time_left <= 6:
			$Timer/Time.modulate = Color(1,.6,0)
			$Timer/Time.text = str($Timer.time_left).substr(0,4)
		else:
			$Timer/Time.modulate = Color(0,1,0)
			$Timer/Time.text = str(int(floor($Timer.time_left)))
	elif !$Timer.time_left:
		$Timer/Time.modulate = Color(1,0,0)
		$Timer/Time.text = "0:00"
		global.failed = true
	else: $Timer/Time.text = ""
