import numpy as np

def runLengthEncodingIterative(input):
    output = ''
    
    # We start with the first character
    count = 1  
    
    # Loop through the string starting from the second character
    for i in range(1, len(input)):
      
       # If the current character is the same as the previous one
        if input[i] == input[i - 1]: 
            count += 1  # Increment the count
        else:
          
              # Add previous character and its count to output
            output += f"|{input[i - 1]}-{count}|"  
            
            # Reset count for the new character
            count = 1  
    
    # After the loop, we still need to add the last character group
    output += f"|{input[-1]}-{count}|"
    
    return output

input = "1111111111000022112222110020010012211221120000121212212100021000"
print(f"Number of Bytes in original: {len(input)}")
print(f"Encoded: {runLengthEncodingIterative(input)}")
print(f"Number of Bytes in encoded: {len(runLengthEncodingIterative(input))}")


Qd = np.array(
[
    [  1,   2,   1,   4,   1,   4,   4,  32],
    [  2,   4,   2,   8,   4,   8,   4,  32],
    [  1,   2,   1,   8,   1,   4,   4,  16],
    [  4,   8,   4,  16,  16,  32,   8, 128],
    [  1,   4,   2,  16,  512,   8,   8,  32],
    [  4,   8,  16,  32,   8,  32,   8,  64],
    [  2,   4,   4,  16,  16,  16,   8,  32],
    [ 16,  32,  16,  64,  32,  64,  32,  64]
], dtype=np.int16)

print(f"Qd shift values: {np.log2(Qd).astype(np.int8)}")