# This program will print its own source in a file named Grace_kid.py

def display(f, s):
	f.write(s.format(s = s, c = chr(34)))

def grace(s):
	if __name__ == '__main__':
		try:
			with open('Grace_kid.py', 'w') as f:
				display(f, s)
		except:
			exit(1)

s = """# This program will print its own source in a file named Grace_kid.py

def display(f, s):
	f.write(s.format(s = s, c = chr(34)))

def grace(s):
	if __name__ == '__main__':
		try:
			with open('Grace_kid.py', 'w') as f:
				display(f, s)
		except:
			exit(1)

s = {c}{c}{c}{s}{c}{c}{c}

grace(s)
"""

grace(s)
