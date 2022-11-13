extends Label
var time = 0

func _physics_process(_delta):
	time += _delta
	Globalvar.time_seconds = round(fmod(time,60))
	Globalvar.time_minutes = int(fmod(time, 3600) / 60.0)
	if (Globalvar.time_minutes <= 0):
		set_text(str(Globalvar.time_seconds))
	elif (Globalvar.time_seconds <= 9):
		set_text(str(Globalvar.time_minutes)+":0 "+str(Globalvar.time_seconds))
		
	
	else:
		set_text(str(Globalvar.time_minutes)+":"+str(Globalvar.time_seconds))
	

#func _on_gameend9_body_entered(_body):
	#print(time)
	
