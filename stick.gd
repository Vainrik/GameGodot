extends Sprite2D

@onready var parent = $".."
@export var maxLength = 50
@export var deadzone =5
var pressing = false

func _ready():
	maxLength*=parent.scale.x
	pass
func _process(delta):
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position)<=maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x +cos(angle)*maxLength
			global_position.y = parent.global_position.y + sin(angle)*maxLength
		calculateVector()
	else:
		global_position=lerp(global_position, parent.global_position,delta*50)
		parent.posVector = Vector2(0,0)
func calculateVector():
	if abs((global_position.x-parent.global_position.x))>=deadzone:
		parent.posVector.x = (global_position.x - parent.global_position.x)/maxLength
	if abs((global_position.y - parent.global_position.y))>=deadzone:
		parent.posVector.y = (global_position.y - parent.global_position.y)/maxLength
func _on_button_button_down():
	pressing = true
	pass # Replace with function body.


func _on_button_button_up():
	pressing = false
	pass # Replace with function body.
