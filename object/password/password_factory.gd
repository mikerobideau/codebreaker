extends RefCounted
class_name PasswordFactory

var words: Array = []

func load_words() -> void:
	var file: FileAccess = FileAccess.open("res://data/words/google-10000-english-no-swears.txt", FileAccess.READ)
	var full_text = file.get_as_text()
	file.close()
	words = Array(full_text.split('\n', false))
	
func random_word() -> String:
	return words.pick_random()
