extends Area2D

var damage = 50

func _ready():
	set_monitoring(true)
	$AnimatedSprite2D.play()
	pass # Replace with function body.


func _process(delta):

	if $Timer.is_stopped():
		queue_free()
	pass


func _on_body_entered(body):
	if body.is_in_group("mobs") or body.is_in_group("mobs2"):
		body.hit(damage)
	pass # Replace with function body.
