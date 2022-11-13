extends Label

func _ready():
	set_text("Your time: "+str(Globalvar.time_minutes*60+Globalvar.time_seconds) + " seconds")
	Globalvar.time_minutes = 0
	Globalvar.time_seconds = 0
