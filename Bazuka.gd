extends Node2D
@onready var _fire_timer = $FireTimer
# Called when the node enters the scene tree for the first time.
@export var bullet_scene : PackedScene # это будет сцена нашей пули
@export var fire_rate = 4 # скорость атаки


var rotet = Vector2()
@onready var global = get_parent().get_parent().get_node("Global")
var lv1=0
var lv2=0
var lv3=0
func _ready():
	_fire_timer.wait_time = fire_rate
func start():
	_fire_timer.start()


func _process(delta):
	if global.bazuka_lvl == 1 and lv1==0:
		start()
		lv1=1
	if global.bazuka_lvl == 2:
		_fire_timer.wait_time = 3
		lv2=1
	if global.bazuka_lvl == 3:
		_fire_timer.wait_time = 2
		lv3=1
	pass

func _physics_process(delta):
	pass

func _spawn():
	var b = bullet_scene.instantiate()
	add_child(b)

func _on_fire_timer_timeout():
	_spawn()
	pass # Replace with function body.
