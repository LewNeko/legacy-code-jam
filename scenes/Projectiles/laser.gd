extends Area2D

var speed: int = 1000
#At the moment, player only looks up. 
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta
