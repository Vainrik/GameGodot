extends RigidBody2D

@onready var player = get_parent().get_node("Player")
@export var health = 10
var damage = 20
@onready var glob = get_parent().get_node("Global")
var velocity = Vector2.ZERO
var speed = 60
func _ready():
	pass

	
func _physics_process(delta):
	var motion = Vector2.ZERO
	motion += position.direction_to(player.position)
	velocity = Vector2.RIGHT.rotated(rotation) * speed
	#position = position.rotated(rotation)
	#position += (player.position - position)/400
	position+=velocity*delta
	look_at(player.position)
	motion = move_and_collide(motion)
	if motion: #Если столкнулись, то удалить объект
		if motion.get_collider().has_method("taken_hit"): #Вызвали метод, если он есть
			motion.get_collider().taken_hit(damage)	
func hit(damage):
	health -= damage	
	if (health <= 0): #Если <= 0, то удалился
		queue_free()
		glob.score +=1
		glob.exp +=5
