extends CanvasLayer

@onready var timer = $Timer
var boss_time := 0.000

func _physics_process(_delta: float) -> void:
	if !$Timer.is_stopped():
		if $Timer.time_left < 3:
			$Timer/Time.modulate = Color(1,0,0)
			$Timer/Time.text = str($Timer.time_left).substr(0,4)
		elif $Timer.time_left <= 6:
			$Timer/Time.modulate = Color(1,.6,0)
			$Timer/Time.text = str($Timer.time_left).substr(0,4)
		elif $Timer.time_left <= 100:
			$Timer/Time.modulate = Color(0,1,0)
			$Timer/Time.text = str(int(floor($Timer.time_left)))
		else:
			pass
	elif global.boss:
		$Timer/Time.modulate = Color(.5,0,0)
		$Timer/Time.text = str(boss_time).substr(0,7)
		boss_time -= 0.0166666666666
	elif !$Timer.time_left:
		$Timer/Time.modulate = Color(1,0,0)
		$Timer/Time.text = "0.00"
		global.failed = true
	else: $Timer/Time.text = ""
