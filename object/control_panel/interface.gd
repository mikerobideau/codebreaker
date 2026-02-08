extends Panel
class_name Interface

signal clicked(interface: Interface)

@onready var label = $Label
@onready var slot = $Slot
@onready var placeholder = $Slot/Placeholder

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
	if placeholder and data:
		placeholder.text = data.match_label

func insert_die(die: Die) -> void:
	if self.die:
		print_debug('die already set')
		return
	self.die = die
	placeholder.queue_free()
	if die.get_parent():
		die.get_parent().remove_child(die)
	print_debug('adding die')
	slot.add_child(die)
	
func is_empty() -> bool:
	if die == null:
		return true
	return false
