extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_next_scene_body_entered(body: Node2D) -> void:
	#pass # Replace with function body.
	if body is Player:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
	
