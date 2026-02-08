extends Panel
class_name DiceBag

var DieScene = preload("res://object/dice/die.tscn")

var dice: Array[Node]
var DiceColor = DiceData.DiceColor

func populate(n: int) -> void:
	for i in range(n):
		var die = DieScene.instantiate()
		var data = DiceData.new()
		data.color = DiceData.DiceColor.values().pick_random()
		die.init(data)
		dice.append(die)

func select_random(n: int) -> Array[Node]:
	var copy = dice.duplicate()
	var random: Array[Node] = []
	copy.shuffle()
	for i in range(n):
		random.append(copy.pop_front())
	return random
