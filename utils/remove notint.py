import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

def process_file(file_path):
    output_lines = []
    with open(file_path, 'r') as input_file:
        for line in input_file:
            if not '$notint' in line:
                output_lines.append(line)
    with open(file_path, 'w') as output_file:
        output_file.writelines(output_lines)

for root, dirs, files in os.walk(os.getcwd()):
    for file in files:
        if file.endswith('.vmt'):
            file_path = os.path.join(root, file)
            process_file(file_path)