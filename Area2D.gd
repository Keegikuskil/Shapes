extends Area2D




func _on_flag_body_entered(_body):
	#var _x=get_tree().change_scene("res://Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
	#_body.position = Vector2(5081,-81)
	
	#cheat mängu lõppu
	_body.position = Vector2(25512,672)
	
