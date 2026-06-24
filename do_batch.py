import os
import glob
import re
import subprocess

def main():
    files = []
    for root, dirs, filenames in os.walk('.'):
        if 'node_modules' in root or '.git' in root:
            continue
        for filename in filenames:
            if filename.endswith(('.html', '.xml', '.json', '.ts', '.tsx', '.js', '.jsx')):
                files.append(os.path.join(root, filename))

    changed = []
    batch_num = 1
    for file in files:
        if "scripts/config/constants.js" in file or "vite.config.ts" in file:
            continue
        result = subprocess.run(['git', 'diff', '--name-only', file], capture_output=True, text=True)
        if result.stdout.strip() == file:
            changed.append(file)
            if len(changed) >= 5:
                for c in changed:
                    subprocess.run(['git', 'add', c])
                subprocess.run(['git', 'commit', '-m', f"chore: fix links batch {batch_num}"])
                changed = []
                batch_num += 1

    if len(changed) > 0:
        for c in changed:
            subprocess.run(['git', 'add', c])
        subprocess.run(['git', 'commit', '-m', f"chore: fix links batch {batch_num}"])

if __name__ == '__main__':
    main()
