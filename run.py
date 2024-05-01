import subprocess

for input_value in range(1, 51):
    # Execute hi.exe with the input value and capture the output
    
    output = subprocess.check_output(['./PA3_test.exe'], input=str(input_value).encode())

    # Read the corresponding output file
    with open(f'output/output{input_value}.txt', 'r') as file:
        expected_output = file.read()

    # Compare the outputs
    
    if output.strip().decode() != expected_output.strip():
        #print(f"Output for input {input_value} matches!")
    #else:
        #print(output.strip())
        #print(expected_output.strip())
        print(f"Output for input {input_value} does not match!")


       