extends CharacterBody2D
@export var speed = 200
var hp=100
@onready var bar = get_node("TextureProgressBar")
@onready var joystick = $joystick


func _physics_process(delta):
	var direction = joystick.posVector
	if direction:
		velocity = direction*speed
	else:
		velocity = Vector2(0,0)
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x > 0
	move_and_slide()
#func _process(delta):
#
#	var velocity = Vector2.ZERO # The player's movement vector.
#	if Input.is_action_pressed("ui_right") or Input.get_action_strength("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left") or Input.get_action_strength("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down") or Input.get_action_strength("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up") or Input.get_action_strength("ui_up"):
#		velocity.y -= 1
#
##	movedir.x = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
##	movedir.y = +Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
#
##	var velo = movedir * speed
#
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#		$AnimatedSprite2D.play()
#	else:
#		$AnimatedSprite2D.stop()
#	position += velocity * delta
#	#velocity = move_and_collide(velocity)
#	move_and_collide(delta*velocity)
#
#	if velocity.x != 0:
#		$AnimatedSprite2D.animation = "walk"
#		$AnimatedSprite2D.flip_v = false
#		$AnimatedSprite2D.flip_h = velocity.x > 0
func taken_hit(damage):
	if $Timer.is_stopped():
		hp -= damage	
		bar.value =hp
		$Timer.start()
	

