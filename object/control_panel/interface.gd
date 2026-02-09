extends Panel
class_name Interface

signal clicked(interface: Interface)

@onready var label = $Label
@onready var slot = $Slot
@onready var content = $Slot/Content

var data: InterfaceData
var die: Die = null

func _ready() -> void:
	size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	size_flags_vertical = Control.SIZE_SHRINK_CENTER
	update_labels()
	
func _on_placeholder_pressed() -> void:
	clicked.emit(self)
	
func init(d: InterfaceData) -> void:
	set_data(d)
	
func set_data(d: InterfaceData) -> void:
	data = d
	update_labels()
	
func update_labels() -> void:
	if label and data:
		label.text = data.label
	if content and data:
		if die:
			content.text = str(die.value)
		else:
			content.text = data.match_label

func insert_die(die: Die) -> void:
	if self.die:
		return
	if die.get_parent():
		die.get_parent().remove_child(die)
	self.die = die
	update_labels()
	print_debug('slot has ' + str(slot.get_child_count()) + ' children')
	
func is_empty() -> bool:
	if die == null:
		return true
	return false
