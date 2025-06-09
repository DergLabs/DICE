import os

file_name = "/home/phaedrus/Documents/project/arithmetic-coder-fpga/tb_output/side_channel_data.out.txt"

if __name__ == "__main__":
	file = open(file_name, "r")
	text = file.read()
	file.close()

	lines = text.split("\n")
	i = 0
	# Predetermined number of streams: 9
	pending_buffers = [0, 0, 0, 0, 0, 0, 0, 0, 0]
	stream_buffers = ["", "", "", "", "", "", "", "", ""]
	for line in lines:
		# Skip empty last line
		#print(line)
		if line == "":
			continue

		# Get output data for each symbol
		data = line.split(" ")
		bits = data[0]
		count = int(data[1])
		pending = int(data[2])

		# Skip if no bits are output
		if(count == 0):
			pending_buffers[i] += pending
			i = (i + 1) % 9
			continue

		# Add bits to stream
		if(pending_buffers[i] > 0):
			if(i == 0):
				print("bits: " + bits)
				print("bcnt: " + str(count))
				print("pndg: " + str(pending_buffers[i]))
			new_bits = ""
			new_bits += bits[0]
			new_bits += "".join(["1" if bits[0] == '0' else "0" for i in range(pending_buffers[i])])
			new_bits += bits[1:count]
			pending_buffers[i] = pending
			stream_buffers[i] += new_bits
			if(i == 0):
				print("nbit: " + new_bits)
				print("=======================")
		else:
			new_bits = bits[0:count]
			if(i == 0):
				print("bits: " + bits)
				print("bcnt: " + str(count))
				print("nbit: " + new_bits)
				print("=======================")
			stream_buffers[i] += bits[0:count]
			pending_buffers[i] += pending

		# On to next stream
		i = (i + 1) % 9

	# Print each stream
	for j in range(9):
		print(stream_buffers[j])
