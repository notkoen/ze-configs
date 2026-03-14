import os

# Traverse the directory tree from the bottom up
for root, dirs, files in os.walk(os.getcwd(), topdown=False):
    # Rename files
    for file in files:
        old_path = os.path.join(root, file)
        new_path = os.path.join(root, file.lower())
        if old_path != new_path:  # Avoid errors if already lowercase
            os.rename(old_path, new_path)
    
    # Rename directories
    for dir in dirs:
        old_path = os.path.join(root, dir)
        new_path = os.path.join(root, dir.lower())
        if old_path != new_path:  # Avoid errors if already lowercase
            os.rename(old_path, new_path)