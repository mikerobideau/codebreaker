extends Panel
class_name Interface

@onready var label = $Label

func _ready() -> void:
	pass
	
func init(data: InterfaceData) -> void:
	label.text = data.label
