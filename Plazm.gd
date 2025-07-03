extends Node2D

@onready var _fire_timer = $FireTimer
@onready var timer = $Timer
@onready var player = get_parent().get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
@export var bullet_scene : PackedScene # это будет сцена нашей пули
@export var fire_rate = 0.5 # скорость атаки
@export var damage = 3 # урон 
@export var bullet_speed= 2000 # скорость 
var rotet = Vector2()
@onready var global = get_parent().get_parent().get_node("Global")
var lv2= 0
var lv3=0
var lll=1
func _ready():
	_fire_timer.wait_time = fire_rate

func spawn_bullet():# передаём параметр дополнительного поворота пули, позже пригодится 
	var b = bullet_scene.instantiate()
	var new_rotet = (rotet-player.global_position)
	b.global_rotation = atan2(new_rotet.y,new_rotet.x)

	get_input()
	
	get_parent().add_child(b)# добавляем пулю, как потомка оружия
	b.velocity = Vector2.RIGHT.rotated(b.rotation) * bullet_speed
	b.position = b.position+Vector2(20,0).rotated(b.rotation)
	b.damage = damage# задаём пуле урон

func _process(delta):
	if global.plazm_lvl == 2:
		lv2=1
	if global.plazm_lvl == 3:
		lv3=1
	pass

func get_input():
	# get spawn nodes

	var spawn_mobs = get_tree().get_nodes_in_group("mobs")
	spawn_mobs.append_array(get_tree().get_nodes_in_group("mobs2"))
	var nearest_spawn_mob = spawn_mobs[0]

	for spawn_mob in spawn_mobs:
		if spawn_mob.position.distance_to(player.position) < nearest_spawn_mob.position.distance_to(player.position):
			nearest_spawn_mob = spawn_mob
	rotet = nearest_spawn_mob.global_position
	
func _physics_process(delta):
	pass


func _on_fire_timer_timeout():
	spawn_bullet()
	if lv2==1:
		$Timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	spawn_bullet()
	if lv3==1:
		$Timer.start()
	pass # Replace with function body.


func _on_timer_2_timeout():
	spawn_bullet()
	if lll==1:
		$Timer.start()
	pass # Replace with function body.


func _on_timer_3_timeout():
	spawn_bullet()
	pass # Replace with function body.
