extends KinematicBody2D
enum States  {AIR = 1, FLOOR, WALL}
var state = States.AIR
const SPEED = 400
const SPRINTSPEED = 700
var velocity = Vector2(0,0)
var direction = 1
const JUMPFORCE = -1250
const GRAVITY = 45
const SQUARE = 1
const TRIANGLE = 2
var type = SQUARE or TRIANGLE
#Repeats something
func _physics_process(_delta):
	#if type == SQUARE:
		
	#elif type == TRIANGLE:
		#JUMPFORCE = -800
	
		
	match state:
		States.AIR:
			if is_on_floor():
				state = States.FLOOR
				continue
			elif is_near_wall():
				state = States.WALL
				continue
			$Sprite.play("air")
			if Input.is_action_pressed("Right"):
				velocity.x = lerp(velocity.x,SPEED,0.1) if velocity.x < SPEED else lerp(velocity.x,SPEED,0.03)
				$Sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				velocity.x = lerp(velocity.x,-SPEED,0.1) if velocity.x < SPEED else lerp(velocity.x,-SPEED,0.03)
				$Sprite.flip_h = true
			else:
				velocity.x = lerp(velocity.x,0,0.2)
			
			move_and_fall(false)
			set_direction()
		States.FLOOR:
			if not is_on_floor():
				state = States.AIR
			#if Input.is_action_pressed("change"):
				
			if Input.is_action_pressed("Right"):
				if Input.is_action_pressed("sprint"):
					velocity.x = lerp(velocity.x,SPRINTSPEED,0.1)
				else:
					velocity.x = lerp(velocity.x,SPEED,0.1)
				
				$Sprite.play("move")
				$Sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				if Input.is_action_pressed("sprint"):
					velocity.x = lerp(velocity.x,-SPRINTSPEED,0.1)
				else:
					velocity.x = lerp(velocity.x,-SPEED,0.1)
				$Sprite.play("move")
				$Sprite.flip_h = true
			else:
				$Sprite.play("idle")
				velocity.x = lerp(velocity.x,0,0.2)
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMPFORCE
				state = States.AIR
			
			set_direction()
			move_and_fall(false)
		States.WALL:
			if is_on_floor():
				state = States.FLOOR
				continue
			elif not is_near_wall():
				state = States.AIR
				continue
			
			
			if Input.is_action_pressed("jump") and ((Input.is_action_pressed("left") and direction == 1) or (Input.is_action_pressed("Right") and direction == -1)):
			
				velocity.x = 500 * -direction
				velocity.y = JUMPFORCE * 0.7
				state = States.AIR
				
			move_and_fall(true)
			
			
			
			
			
func set_direction():
	direction = 1 if not $Sprite.flip_h else -1
	$Wallchecker.rotation_degrees = 90 * -direction
			

			
	
	
	
	




func is_near_wall():
	return $Wallchecker.is_colliding()

func move_and_fall(slow_fall: bool):
	velocity.y = velocity.y + GRAVITY
	
	if slow_fall:
		velocity.y = clamp(velocity.y, JUMPFORCE, 300)
	
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_Fallzone_body_entered(_body):
	var _x=get_tree().change_scene("res://GameOver.tscn")
	

