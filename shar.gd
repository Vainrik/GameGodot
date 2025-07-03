extends Node2D

@export var shar : PackedScene
var s
var ss 
var sss 
var ssss 
var lvl = 0
var lv1 = 0
var lv2 = 0
var lv3 = 0
var lll = 0
@onready var global = get_parent().get_parent().get_node("Global")
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.shar_lvl==1 and lv1==0:
		s = shar.instantiate()
		add_child(s)
		lv1=1
	if lv1==1:
		if s.position.x < (-148) and lv1==1 and lv2==0 and global.shar_lvl==2:
			ss = shar.instantiate()
			add_child(ss)
			lv2=1
	if lv2 == 1:
		if ss.position.y > 148 and lv2==1 and lv3==0 and global.shar_lvl==3:
			sss = shar.instantiate()
			add_child(sss)
			lv3=1
	if lv3 == 1:
		if ss.position.y < (-148) and lv3==1 and lll==0 and s.position.y > 148 and sss.position.x < (-148):
			ssss = shar.instantiate()
			add_child(ssss)
			lll=1
	pass
