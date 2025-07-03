extends CanvasLayer

@onready var global = get_parent().get_node("Global")
@onready var node = get_parent().get_parent().get_node("node")
var shar_texture_normal = preload("res://Sprites/spells/молния.png")
var shar_texture_pressed = preload("res://Sprites/spells/молния нажатая.png")
var plazm_texture_normal = preload("res://Sprites/spells/оружие.png")
var plazm_texture_pressed = preload("res://Sprites/spells/оружие нажатая.png")
var luch_texture_normal = preload("res://Sprites/spells/пушка.png")
var luch_texture_pressed = preload("res://Sprites/spells/пушка нажатая.png")
var bazuka_texture_normal = preload("res://Sprites/spells/скилл_ракетница.png")
var bazuka_texture_pressed = preload("res://Sprites/spells/скилл_ракетница.png")
var shield_texture_normal = preload("res://Sprites/spells/скилл_щит.png")
var shield_texture_pressed = preload("res://Sprites/spells/скилл_щит.png")
var rng = RandomNumberGenerator.new()
var kkk =0
var kk=0
var rand
var spells = ["plazm","plazm","luch","luch","luch","shar","shar","shar","bazuka","bazuka","bazuka","shield","shield","shield"]
var spel = {"plazm":1,"luch":0,"shar":0,"bazuka":0,"shield":0}

func up():
#	$MenuSpells.show()
	$MenuSpells/Odin.texture_normal = null
	$MenuSpells/Odin.texture_pressed = null
	$MenuSpells/Dwa.texture_normal = null
	$MenuSpells/Dwa.texture_pressed = null
	var k=0
	var random_int_num
	var point = 0
	
	while point != 2:
		rng.randomize()
		random_int_num = rng.randi_range(0, 4)
		var arr = spel.keys()

		if arr[random_int_num]=="plazm" and rand != "plazm" and spel["plazm"]!=3:
			if point == 0:
				$MenuSpells/Odin.texture_normal = plazm_texture_normal
				$MenuSpells/Odin.texture_pressed = plazm_texture_pressed
				kkk=1
				rand ="plazm"
				k=1
			else:
				$MenuSpells/Dwa.texture_normal = plazm_texture_normal
				$MenuSpells/Dwa.texture_pressed = plazm_texture_pressed
				kk=1
				rand=""
			point+=1
		elif arr[random_int_num]=="luch" and rand != "luch" and spel["luch"]!=3:
			if point == 0:
				$MenuSpells/Odin.texture_normal = luch_texture_normal
				$MenuSpells/Odin.texture_pressed = luch_texture_pressed
				kkk=2
				rand ="luch"
				k=1
			else:
				$MenuSpells/Dwa.texture_normal = luch_texture_normal
				$MenuSpells/Dwa.texture_pressed = luch_texture_pressed
				kk=2
				rand=""
				
			point+=1
		elif arr[random_int_num]=="shar" and rand != "shar" and spel["shar"]!=3:
			if point == 0:
				$MenuSpells/Odin.texture_normal =shar_texture_normal
				$MenuSpells/Odin.texture_pressed = shar_texture_pressed
				kkk=3
				rand ="shar"
				k=1
			else:
				$MenuSpells/Dwa.texture_normal =shar_texture_normal
				$MenuSpells/Dwa.texture_pressed = shar_texture_pressed
				kk=3
				rand=""
			point+=1
		elif arr[random_int_num]=="bazuka" and rand != "bazuka" and spel["bazuka"]!=3:
			if point == 0:
				$MenuSpells/Odin.texture_normal =bazuka_texture_normal
				$MenuSpells/Odin.texture_pressed = bazuka_texture_pressed
				kkk=4
				rand ="bazuka"
				k=1
			else:
				$MenuSpells/Dwa.texture_normal =bazuka_texture_normal
				$MenuSpells/Dwa.texture_pressed = bazuka_texture_pressed
				kk=4
				rand=""
			point+=1
		elif arr[random_int_num]=="shield" and rand != "shield" and spel["shield"]!=3:
			if point == 0:
				$MenuSpells/Odin.texture_normal =shield_texture_normal
				$MenuSpells/Odin.texture_pressed = shield_texture_pressed
				kkk=5
				rand ="shield"
				k=1
			else:
				$MenuSpells/Dwa.texture_normal =shield_texture_normal
				$MenuSpells/Dwa.texture_pressed = shield_texture_pressed
				kk=5
				rand=""
			point+=1
		var spel_max=spel.size()
		for key in spel:
			if spel[key]==3 and k!=0:
				spel_max-=1
		if spel_max==1:
			point+=1
			rand=""
			k=0
	
func _ready():
	$Paused.hide()
	$Setting.hide()
	pass # Replace with function body.

func _process(delta):
	pass

func _on_odin_pressed():
	if kkk==1:
		spel["plazm"]+=1
		global.plazm_lvl+=1
		kkk=0
	if kkk==2:
		spel["luch"]+=1
		global.luch_lvl+=1
		kkk=0
	if kkk==3:
		spel["shar"]+=1
		global.shar_lvl+=1
		kkk=0
	if kkk==4:
		spel["bazuka"]+=1
		global.bazuka_lvl+=1
		kkk=0
	if kkk==5:
		spel["shield"]+=1
		global.shield_lvl+=1
		kkk=0
	node.get_tree().paused = false
	$MenuSpells.hide()
	pass # Replace with function body.


func _on_dwa_pressed():
	if kk==1:
		spel["plazm"]+=1
		global.plazm_lvl+=1
		kk=0
	if kk==2:
		spel["luch"]+=1
		global.luch_lvl+=1
		kk=0
	if kk==3:
		spel["shar"]+=1
		global.shar_lvl+=1
		kk=0
	if kk==4:
		spel["bazuka"]+=1
		global.bazuka_lvl+=1
		kk=0
	if kk==5:
		spel["shield"]+=1
		global.shield_lvl+=1
		kk=0
	node.get_tree().paused = false
	$MenuSpells.hide()
	pass # Replace with function body.


func _on_odinodin_pressed():
	node.get_tree().paused = false
	$Paused.hide()
	pass # Replace with function body.


func _on_dwadwa_pressed():
	node.get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
	pass # Replace with function body.


func _on_pause_pressed():
	$Paused.show()
	node.get_tree().paused = true
	pass # Replace with function body.


func _on_texture_button_pressed():
	node.get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_texture_button_2_pressed():
	node.get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
	pass # Replace with function body.


func _on_three_but_pressed():
	$Setting.show()
	$Paused.hide()
	pass # Replace with function body.


func _on_but_pressed():
	$Setting.hide()
	$Paused.show()
	pass # Replace with function body.


func _on_audio_node_finished():
	$Setting/AudioNode.play()
	pass # Replace with function body.
