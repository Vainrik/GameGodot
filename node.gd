extends Node

@export var mob_scene: PackedScene

@onready var player = get_node("Player")
@export var mob2_scene: PackedScene
var usl =1
var health = 10
var health2 = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/MenuSpells.visible = false
	$HUD/GameOver.visible = false
	$HUD/exper.max_value = 10
	var nn =2000
	for n in 4:
		var pos = Vector2(nn,2000)
		var mob = mob_scene.instantiate()
		mob.position=pos
		add_child(mob)
		nn*=-1
	for n in 2:
		var pos = Vector2(0,nn)
		var mob = mob_scene.instantiate()
		mob.position=pos
		add_child(mob)
		nn*=-1
	for n in 2:
		var pos = Vector2(nn,0)
		var mob = mob_scene.instantiate()
		mob.position=pos
		add_child(mob)
		nn*=-1
	pass # Replace with function body.
func paus():
	$Player/joystick/stick.pressing = false;
	$HUD/MenuSpells.visible = true
	get_tree().paused = true
	$HUD.up()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Global.exp == 10 and $Global.level == 0:
		$Global.level +=1
		$HUD/exper.min_value = 10
		$HUD/exper.max_value = 40
		paus()
	if $Global.exp >= 40 and $Global.level == 1 and $Global.exp<80 and usl!=0:
		usl=0
		$Global.level +=1
		$HUD/exper.min_value = 40
		$HUD/exper.max_value = 80
		get_tree().paused = true
		paus()
	if $Global.exp >= 80 and $Global.level == 2 and $Global.exp<130 and usl!=1:
		usl=1
		$Global.level +=1
		
		$HUD/exper.min_value = 80
		$HUD/exper.max_value = 130
		get_tree().paused = true
		paus()
	if $Global.exp >= 130 and $Global.level == 3 and $Global.exp<190 and usl!=0:
		usl=0
		$Global.level +=1
		$HUD/exper.min_value = 130
		$HUD/exper.max_value = 190
		get_tree().paused = true
		paus()
	if $Global.exp >= 190 and $Global.level == 4 and $Global.exp<260 and usl!=1:
		usl=1
		$Global.level +=1
		$HUD/exper.min_value = 190
		$HUD/exper.max_value = 260
		get_tree().paused = true
		paus()
	if $Global.exp >= 260 and $Global.level == 5 and $Global.exp<340 and usl!=0:
		usl=0
		$Global.level +=1
		$HUD/exper.min_value = 260
		$HUD/exper.max_value = 340
		get_tree().paused = true
		paus()
	if $Global.exp >= 340 and $Global.level == 6 and $Global.exp<430 and usl!=1:
		usl=1
		$Global.level +=1
		$HUD/exper.min_value = 340
		$HUD/exper.max_value = 430
		get_tree().paused = true
		paus()
	if $Global.exp >= 430 and $Global.level == 7 and $Global.exp<540 and usl!=0:
		usl=0
		$Global.level +=1
		$HUD/exper.min_value = 430
		$HUD/exper.max_value = 540
		get_tree().paused = true
		paus()
	if $Global.exp >= 540 and $Global.level == 8 and $Global.exp<660 and usl!=1:
		usl=1
		$Global.level +=1
		$HUD/exper.min_value = 540
		$HUD/exper.max_value = 660
		get_tree().paused = true
		paus()
	if $Global.exp >= 660 and $Global.level == 9 and $Global.exp<790 and usl!=0:
		usl=0
		$Global.level +=1
		$HUD/exper.min_value = 660
		$HUD/exper.max_value = 790
		get_tree().paused = true
		paus()
	if $Global.exp >= 790 and $Global.level == 10 and $Global.exp<930 and usl!=1:
		usl=1
		$Global.level +=1
		$HUD/exper.min_value = 790
		$HUD/exper.max_value = 930
		get_tree().paused = true
		paus()
	if $Global.exp >= 930 and $Global.level == 11 and $Global.exp<1090 and usl!=0:
		usl=0
		$Global.level +=1
		$HUD/exper.min_value = 930
		$HUD/exper.max_value = 1090
		get_tree().paused = true
		paus()
	if $Global.exp >= 1090 and $Global.level == 12 and $Global.exp<1260 and usl!=1:
		usl=1
		$Global.level +=1
		$HUD/exper.min_value = 1090
		$HUD/exper.max_value = 1260
		get_tree().paused = true
		paus()
	if $Global.exp >= 1260 and $Global.level == 13 and $Global.exp<1300 and usl!=0:
		usl=0
		$Global.level +=1
		get_tree().paused = true
		paus()
	$HUD/exper.value = $Global.exp
	var minutes = $Global.time / 60
	var seconds = fmod($Global.time, 60)
	var str = "%02d:%02d" % [minutes, seconds]
	$HUD/Label.text = str
	$HUD/GameOver/time.text = str
	$HUD/GameOver/kill.text = str($Global.score)
	if $Player.hp <=0:
		get_tree().paused = true
		$HUD/GameOver.visible = true
#		get_tree().change_scene_to_file("res://menu.tscn")
	pass

func _on_enemy_timer_timeout():

	var mob = mob_scene.instantiate()

	var mob_spawn_location = get_node("PathEnemy/SpawnEnemy")
	mob_spawn_location.progress_ratio = randf()
	mob.position = mob_spawn_location.position
	add_child(mob)
	mob.health = health

func _on_timer_timeout():
	if $Global.time == 60:
		$EnemyTimer.wait_time = 0.8
		$TimerMob2.wait_time = 7
		health = 15
		health2 = 65
	if $Global.time == 120:
		$EnemyTimer.wait_time = 0.6
		$TimerMob2.wait_time = 6
		health = 20
		health2 = 80
	if $Global.time == 180:
		$EnemyTimer.wait_time = 0.5
	if $Global.time == 240:
		$EnemyTimer.wait_time = 0.3
		$TimerMob2.wait_time = 5
		health = 30
		health2 = 100
	$Global.time+=1
	pass # Replace with function body.

func _on_timer_mob_2_timeout():
	var mob2 = mob2_scene.instantiate()
	var mob_spawn_location = get_node("PathEnemy/SpawnEnemy")
	mob_spawn_location.progress_ratio = randf()
	mob2.position = mob_spawn_location.position
	add_child(mob2)
	mob2.health = health2
	pass # Replace with function body.
