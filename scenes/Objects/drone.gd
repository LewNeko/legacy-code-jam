extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#direction 
	var direction = Vector2.RIGHT
	
	#velocity; remember that velocity automatically implements delta in character body 
	velocity = direction * 400
	
	#move_and_slide
	move_and_slide()
