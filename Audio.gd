extends AudioStreamPlayer

@onready var set = get_parent().get_node("Label3")
@onready var setes = get_parent().get_node("HSlider")
# Called when the node enters the scene tree for the first time.
func _ready():
	setes.value = SetLoad.value
	set.text = str(SetLoad.value+100)
	volume_db = SetLoad.value*0.5
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_h_slider_value_changed(value):
	set.text = str(value+100)
	volume_db = value*0.5
	SetLoad.value = value
	pass # Replace with function body.
