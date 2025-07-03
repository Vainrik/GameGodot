extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Setting.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://loading.tscn")
	pass # Replace with function body.


func _on_out_buttun_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_but_set_pressed():
	get_tree().paused = true
	$Setting.visible = true
	pass # Replace with function body.


func _on_but_pressed():
	$Setting.visible = false
	get_tree().paused = false
	pass # Replace with function body.

