extends Node
class_name DiceStock

signal die_selected(die: Die)

@onready var vbox = $VBox

var dice: Array[Node]

func add(new_dice: Array[Node]) -> void:
	for die in new_dice:
		die.clicked.connect(on_die_clicked)
		dice.append(die)
		vbox.add_child(die)
		die.roll()

func reroll_all() -> void:
	for die in dice:
		die.roll()

func on_die_clicked(die: Die) -> void:
	die_selected.emit(die)
