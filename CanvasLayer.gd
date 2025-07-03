extends CanvasLayer

signal use_move_vector
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $TouchScreenButton.is_pressed():
			var move_vector = calculate_move_vector(event.position)
			
func calculate_move_vector(event_position):
	var texture_center = $TouchScreenButton.position
	return (event_position - texture_center).normalized()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
