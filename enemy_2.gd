extends RigidBody2D

@onready var player = get_parent().get_node("Player")
@export var health = 50
var damage = 20
@onready var glob = get_parent().get_node("Global")
var velocity = Vector2.ZERO
var speed = 2
var direction = Vector2()
func _ready():
	$AnimatedSprite2D.play()
	pass

	
func _physics_process(delta):
	var motion = Vector2.ZERO
	motion =0
	var player_position = player.global_position
	var direction = (player_position - position).normalized()

	$AnimatedSprite2D.flip_h = (direction.x < 0)

	motion = move_and_collide(direction * speed)
	if motion: #Если столкнулись, то удалить объект
		if motion.get_collider().has_method("taken_hit"): 
			motion.get_collider().taken_hit(damage)	
func hit(damage):
	health -= damage	
	if (health <= 0): #Если <= 0, то удалился
		queue_free()
		glob.score +=1
		glob.exp +=30
