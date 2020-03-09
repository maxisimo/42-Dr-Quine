# This program will print its own source

def display(s):
	print(s.format(s = s, c = chr(34)))

if __name__ == '__main__':
	# Another comment
	s = """# This program will print its own source

def display(s):
	print(s.format(s = s, c = chr(34)))

if __name__ == '__main__':
	# Another comment
	s = {c}{c}{c}{s}{c}{c}{c}
	display(s)"""
	display(s)
