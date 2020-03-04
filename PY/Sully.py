from os import system

def file(i):
	return 'Sully_' + str(i) + '.py'

def display(f, s, i):
	f.write(s.format(s = s, c = chr(34), i = i))

s = """from os import system

def file(i):
	return 'Sully_' + str(i) + '.py'

def display(f, s, i):
	f.write(s.format(s = s, c = chr(34), i = i))

s = {c}{c}{c}{s}{c}{c}{c}

if __name__ == '__main__':
	i = {i}
	try:
		with open(file(i), 'w') as f:
			display(f, s, i - 1)
	except:
		exit(1)
	if i > 0:
		system('python ' + file(i))
"""

if __name__ == '__main__':
	i = 5
	try:
		with open(file(i), 'w') as f:
			display(f, s, i - 1)
	except:
		exit(1)
	if i > 0:
		system('python ' + file(i))
