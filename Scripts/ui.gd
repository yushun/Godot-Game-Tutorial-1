extends CanvasLayer

class_name UI

@onready var label: Label = %Label
@onready var next_level_container: CenterContainer = $NextLevelContainer

var time_passed = 0
var is_time_stopped = false

func _process(delta: float) -> void:
	if !is_time_stopped:
		time_passed += delta
		label.text = "%.2f" % time_passed
	
	
func on_level_finished():
	is_time_stopped = true
	next_level_container.visible = true


func _on_button_pressed() -> void:
	print("button")
