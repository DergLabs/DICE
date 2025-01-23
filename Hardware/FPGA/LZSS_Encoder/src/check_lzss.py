


if __name__ == '__main__':

    code_array = []

    with open('.\\src\\LZSS_Output.txt', 'r') as file:
        for line in file:
            if(line[0] == '0'):
                code_array.append(line[1:3])
            elif(line[0] == '1'):
                offset = int(line[1], 16)
                length = int(line[2], 16)

                for i in range(length):
                    code_array.append(code_array[-(offset+1)])
    

    input_array = []

    with open('.\\src\\LSZZ_Input.txt', 'r') as file2:
        for line in file2:
            input_array.append(line.replace("\n", ""))


    for i in range(len(code_array)):
        print(f"item {i} in the arrays: {input_array[i]} = {code_array[i]}")


