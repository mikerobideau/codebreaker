extends Button
class_name Die

signal clicked(die: Die)

@onready var label = $Label

var value: int
var data: DiceData

func _ready() -> void:
	size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	pass
	
func _on_pressed() -> void:
	clicked.emit(self)
	
func init(data: DiceData) -> void:
	self.data = data
	refresh_label(value)
	
func set_value(new_value: int) -> void:
	value = new_value
	refresh_label(new_value)
		
func refresh_label(new_value: int) -> void:
	if label:
		label.text = str(new_value)
	
func roll() -> void:
	set_value(randi_range(1, 6))
	
func color() -> DiceData.DiceColor:
	return data.color
