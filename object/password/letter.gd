extends Panel
class_name Letter

@onready var label = $Label

var value: String
var is_solved: bool
const UNSOLVED_CHAR = '_'

func _ready() -> void:
	update_label()

func solve() -> void:
	is_solved = true
	update_label()
	
func update_label() -> void:
	if is_solved:
		label.text = value
	else:
		label.text = UNSOLVED_CHAR
