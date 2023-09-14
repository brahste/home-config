import argparse
import sys

def remove_comments(lines):
    cleaned_lines = []
    in_comment_block = False

    for line in lines:
        line = line.strip()
        line = line.replace(" ", "")

        if in_comment_block:
            if line.endswith("*/"):
                in_comment_block = False
            continue

        if line.startswith("/*"):
            if not line.endswith("*/"):
                in_comment_block = True
            continue

        if not line.startswith("#") and not line.startswith("//"):
            cleaned_lines.append(line)

    return "".join(cleaned_lines)

def main():
    parser = argparse.ArgumentParser(description='Read a file and print its contents without comments.')
    parser.add_argument('file_path', nargs='?', help='Path to the input file (optional)')

    args = parser.parse_args()
    file_path = args.file_path

    if file_path:
        try:
            with open(file_path, 'r') as file:
                lines = file.readlines()
        except FileNotFoundError:
            print(f"Error: File '{file_path}' not found.")
            sys.exit(1)
    else:
        # Read from stdin if no file path is provided
        lines = sys.stdin.readlines()

    cleaned_content = remove_comments(lines)
    print(cleaned_content)

if __name__ == "__main__":
    main()
