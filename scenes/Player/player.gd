extends CharacterBody2D

#Used in creating a delay between shooting 
var can_laser: bool = true
var can_grenade: bool = true

#Have the laser signal take in position 
signal laser(pos, direction)
signal grenade(pos, direction)

# Called when the node enters the scene tree for the first time.
func _ready():
	print('')



func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500 
	move_and_slide()
	
	#Rotate 
	look_at(get_global_mouse_position())
	
	# laser shooting input 
	# and instead of &&
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_pressed('primary action') and can_laser:
		
		#Stores an array of markers 
		var lasers_markers = $LaserStartPositions.get_children()
		var selected_laser = lasers_markers[randi() % lasers_markers.size()]
		can_laser = false
		#We want to randomly select one of the markers for the laser's starting position
		$Timer.start()
		# Emit for the position and directionthat we selected 
		
		laser.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_pressed('secondary action') and can_grenade:
		can_grenade = false
		$GrenadeReloadTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
		# Emit a signal for direction 
		
		grenade.emit(pos, player_direction)
		
func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grenade = true

#i found the scripts!
