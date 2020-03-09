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
	if not __debug__:
		i -= 1
	if i >= 0:
		try:
			with open(file(i), 'w') as f:
				display(f, s, i)
		except:
			exit(1)
		system("python -O " + file(i))
"""

if __name__ == '__main__':
	i = 5
	if not __debug__:
		i -= 1
	if i >= 0:
		try:
			with open(file(i), 'w') as f:
				display(f, s, i)
		except:
			exit(1)
		system("python -O " + file(i))
