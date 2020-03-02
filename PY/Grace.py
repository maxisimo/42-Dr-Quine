# Un commentaire
def display(f, s):
	f.write(s%s)

def ft(s):
	if __name__ == '__main__':
		try:
			with open('Grace_kid.py', 'w') as f:
				display(f, s)
		except:
			exit(1)

s = "# Un commentaire\ndef display(f, s):\n\tf.write(s%%s)\n\ndef ft(s)\n\tif __name__ == '__main__':\n\t\ttry:\n\t\t\twith open('Grace_kid.py', 'w') as f:\n\t\t\t\tdisplay(f, s)\n\t\texcept:\n\t\t\texit(1)\n\ns = %r\n\nft(s)"

ft(s)
