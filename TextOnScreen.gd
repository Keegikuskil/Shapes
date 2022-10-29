extends Label
var time = 0

func _physics_process(_delta):
	time += _delta
	var seconds = fmod(time,60)
	var minutes = fmod(time, 3600) / 60
	
	var str_elapsed = "%2d : %2d" % [minutes, seconds]
	
	#print("elapsed : ", str_elapsed)
	set_text(str(str_elapsed))
