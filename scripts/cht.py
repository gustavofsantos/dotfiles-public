#!/usr/bin/python3
import subprocess
import urllib.parse

languages = ["javascrit", "typescript", "python3"]
tools = ["git", "tmux", "sed"]

def query_language(language: str, query: str):
    subprocess.run(["curl", f"cht.sh/{language}/{urllib.parse.quote_plus(query)}"])

if __name__ == '__main__':
    subprocess.run(['printf', '\n'.join(languages + tools), '|', 'fzf'])
