extends Resolver
class_name LetterResolver

func resolve(context: ResolverContext) -> void:
	print_debug('calling letter resolver')
	var matches = context.interface.data.letter_logic.get_matches(context.password)
	print_debug('found ' + str(matches.size()) + ' matches')
	for letter in matches:
		letter.solve()
