extends RigidBody2D
var speed = 500
@export var damage = 40
var velocity = Vector2(0,-1)

func _ready():
	$AnimatedSprite2D.play()
	pass


func _physics_process(delta):
	var movement = velocity * delta
	if $Timer.is_stopped():
		queue_free()
	var collision = move_and_collide(movement)
	
	if collision: #Если столкнулись, то удалить объект
		if collision.get_collider().has_method("hit"): #Вызвали метод, если он есть
			collision.get_collider().hit(damage)	
#		queue_free()

