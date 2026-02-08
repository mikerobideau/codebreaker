extends Control
class_name Password

var LetterScene = preload("res://object/password/letter.tscn")

@onready var letters = $Letters

var password: String
var factory: PasswordFactory

func _ready() -> void:
	factory = PasswordFactory.new()
	factory.load_words()
	password = factory.random_word()
	add_letters()

func set_password() -> void:
	factory.load_words()
	password = factory.random_word()
	add_letters()
	
func add_letters() -> void:
	for letter in password:
		var letter_node = LetterScene.instantiate()
		letter_node.value = letter
		letters.add_child(letter_node)
		
func get_letters() -> Array[Node]:
	return letters.get_children()
