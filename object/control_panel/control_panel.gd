extends Panel
class_name ControlPanel

signal interface_selected(interface: Interface)

var InterfaceScene = preload("res://object/control_panel/interface.tscn")
var vowel_data = preload("res://resource/vowels.tres")

@onready var interfaces = $Interfaces

func _ready() -> void:
	var vowel_scene = InterfaceScene.instantiate()
	vowel_scene.init(vowel_data)
	vowel_scene.clicked.connect(on_interface_clicked)
	interfaces.add_child(vowel_scene)
	
func on_interface_clicked(interface: Interface) -> void:
	interface_selected.emit(interface)
