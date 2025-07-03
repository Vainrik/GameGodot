extends Node

var joystick_center = Vector2.ZERO
var joystick_direction = Vector2.ZERO

signal joystick_moved(direction)

func _process(delta):
	if Input.is_action_pressed("touch"):
		var touch_pos = get_viewport().get_mouse_pos()
		if (touch_pos - joystick_center).length() <= 50: # Радиус джойстика
			joystick_direction = (touch_pos - joystick_center).normalized()
			emit_signal("joystick_moved", joystick_direction)
	else:
		joystick_direction = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		joystick_center = event.position
