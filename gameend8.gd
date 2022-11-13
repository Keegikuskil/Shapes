extends Area2D
var x


func _on_gameend8_body_entered(_body):
	x=get_tree().change_scene("res://Youwin.tscn")
	
