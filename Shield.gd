extends Node2D
@export var bullet_scene : PackedScene
@onready var global = get_parent().get_parent().get_node("Global")
var lv1=0
var mas = []

func _process(delta):
	if global.shield_lvl == 1 and lv1==0:
		$Timer.start()
		$Timer.wait_time = 15
		lv1=1
	if global.shield_lvl == 2 and lv1==1:
		_on_timer_timeout()
		$Timer.wait_time = 10
		lv1=2
	if global.shield_lvl == 3 and lv1==2:
		_on_timer_timeout()
		$Timer.wait_time = 5
		lv1=3
	pass

func _on_timer_timeout():
	for nn in mas:
		if nn!=null:
			nn.queue_free()
	var b = bullet_scene.instantiate()
	b._level(global.shield_lvl)
	add_child(b)
	mas.append(b)
	pass # Replace with function body.
