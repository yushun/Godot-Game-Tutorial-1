extends Node


@onready var finish_line: FinishLine = $"../FinishLine" as FinishLine

var player: Player

func _ready() -> void:
	finish_line.level_won.connect(on_level_won)
	player = get_tree().get_first_node_in_group("player")
	
func on_level_won():
	player.linear_velocity = Vector3.ZERO
	player.freeze =true
	print("You Won!")
