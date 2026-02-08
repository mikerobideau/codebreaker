extends LetterLogic
class_name VowelLogic

func get_matches(password: Password):
	var vowels = ['a', 'e', 'i', 'o', 'u']
	var matches = []
	for letter in password.get_letters():
		if vowels.has(letter.value):
			matches.append(letter)
	return matches
