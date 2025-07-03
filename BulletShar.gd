extends Area2D

var time = 0.0
var speed = 3
var distance_from_center = 150
var damage = 15
func _ready():
	$AnimatedSprite2D.play()
	pass

func _process(delta):
	time += delta
	var angle = speed * time
	var rotation = Vector2(cos(angle), sin(angle))
	position = rotation * distance_from_center

	
func _physics_process(delta):
	pass


func _on_body_entered(body):
	if body: #Если столкнулись, то удалить объект
		if body.has_method("hit"): #Вызвали метод, если он есть
			body.hit(damage)	
	pass # Replace with function body.
