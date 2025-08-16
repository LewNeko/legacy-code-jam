extends Node2D

var laser_scene: PackedScene = preload("res://scenes/Projectiles/laser.tscn")
var grenade_scene: PackedScene = preload('res://scenes/Projectiles/grenade.tscn')

func _on_gate_player_entered_gate(body):
	print('Player has entered gate')
	


func _on_player_laser(pos, direction):
	#Create an instance of the scene
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	#Add the scene to the node tree 
	$Projectiles.add_child(laser)
	print('laser from level')

#Only grenades created inside this function will move 
func _on_player_grenade(pos, direction):
	#as RigidBody2D helps w/ autocomplete 
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	print('grenade from level')
	$Projectiles.add_child(grenade)
