import os

sim_file = "/home/phaedrus/Documents/project/arithmetic-coder-fpga/tb_output/bounds_data.out.txt"
sft_file = "/home/phaedrus/Documents/project/arithmetic-coder-fpga/tb_output/software_bounds_data.txt"

if __name__ == "__main__":
	file = open(sim_file, "r")
	text_sim = file.read()
	file.close()

	file = open(sft_file, "r")
	text_sft = file.read()
	file.close()

	sim_lines = text_sim.split("\n")
	sft_lines = text_sft.split("\n")

	for i in range(0, len(sim_lines), 9):
		sim_line = sim_lines[i]
		sft_line = sft_lines[i]
		stream_index = i % 9
		print("stream " + str(stream_index) + ": " + str(i // 9))
		print(sim_line)
		print(sft_line)
		print()
