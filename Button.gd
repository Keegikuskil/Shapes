extends Button

var x 


func _on_Button_pressed():
	x=get_tree().change_scene("res://Level1.tscn")
