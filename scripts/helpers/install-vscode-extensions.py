import json
import subprocess

def run_command_on_element(element):
    # Replace the following command with the desired command you want to run for each element
    command = f"code --install-extension {element}"
    
    try:
        result = subprocess.check_output(command, shell=True, text=True)
        print(result.strip())
    except subprocess.CalledProcessError as e:
        print(f"Error while running command: {e}")

def main():
    try:
        # Read JSON list from JQ's output
        json_output = input()
        data = json.loads(json_output)
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}")
        return

    for element in data:
        run_command_on_element(element)

if __name__ == "__main__":
    main()
