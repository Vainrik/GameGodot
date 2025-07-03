extends RigidBody2D
@export var damage = 2

var velocity = Vector2(0,-1)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var movement = velocity * delta
#	translate(velocity * delta)
	var collision = move_and_collide(movement)
	if collision: #Если столкнулись, то удалить объект
		if collision.get_collider().has_method("hit"): #Вызвали метод, если он есть
			collision.get_collider().hit(damage)	
		queue_free()



