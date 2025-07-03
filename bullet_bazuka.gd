extends RigidBody2D
@export var bullet_speed= 1500 # скорость 
var rotet = Vector2()
@export var scene : PackedScene
@onready var player = get_parent().get_parent().get_parent().get_node("Player")
var velocity = Vector2(0,-1)
var nn = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	spawn_bullet()
	pass # Replace with function body.
func spawn_bullet():# передаём параметр дополнительного поворота пули, позже пригодится 
	var new_rotet = (rotet-player.global_position)
	global_rotation = atan2(new_rotet.y,new_rotet.x)
	get_input()
	velocity = Vector2.RIGHT.rotated(rotation) * bullet_speed
	position = position+Vector2(30,0).rotated(rotation)
func get_input():
	# get spawn nodes
	var spawn_mobs = get_tree().get_nodes_in_group("mobs")
	spawn_mobs.append_array(get_tree().get_nodes_in_group("mobs2"))
	# assume the first spawn node is closest
	var nearest_spawn_mob = spawn_mobs[0]
	for spawn_mob in spawn_mobs:
		if spawn_mob.position.distance_to(player.position) < nearest_spawn_mob.position.distance_to(player.position):
			nearest_spawn_mob = spawn_mob
	rotet = nearest_spawn_mob.global_position

func _process(delta):
	pass
func _physics_process(delta):
	var movement = velocity * delta
	var collision = move_and_collide(movement)
	if collision and nn==0: #Если столкнулись, то удалить объект
		nn=1
		var b = scene.instantiate()
		b.global_position = global_position

		get_tree().get_root().add_child(b)

		$Timer.start()
		$AnimatedSprite2D.hide()
		if $Timer.is_stopped():
			queue_free()
