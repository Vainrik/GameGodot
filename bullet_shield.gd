extends Area2D

var level = 0
# Called when the node enters the scene tree for the first time.
func _level(intt):
	level = intt
func _ready():
	$AnimatedSprite2D.play("3")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("mobs") or body.is_in_group("mobs2"):
		queue_free()
	pass # Replace with function body.
