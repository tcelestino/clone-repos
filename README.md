# Clone Repos

A simple bash script to clone multiple GitHub repositories using SSH protocol. The script automatically converts HTTPS URLs to SSH format and clones all repositories listed in a text file to your specified directory.

## Prerequisites

- Git installed
- SSH key configured and added to your GitHub account
- Linux/Unix environment

## Setup SSH Key

If you haven't set up your SSH key yet, follow these steps:

1. Generate SSH key:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. Add the SSH key to your GitHub account:
   - Copy your public key: `cat ~/.ssh/id_ed25519.pub`
   - Go to GitHub → Settings → SSH and GPG keys → New SSH key
   - Paste your key and save

## Usage

1. Create a text file (e.g., `repos.txt`) with your repository URLs, one per line:

```
https://github.com/user/repo1
https://github.com/user/repo2
git@github.com:user/repo3.git
```

2. Make the script executable:

```bash
chmod +x clone-repos.sh
```

3. Run the script:

```bash
./clone-repos.sh repos.txt [target_directory]
```

The script accepts two parameters:

- `repos.txt`: Required. File containing repository URLs
- `target_directory`: Optional. Directory where repositories will be cloned (default: ~/Projects)

Examples:

```bash
# Clone to default directory (~/Projects)
./clone-repos.sh repos.txt

# Clone to a specific directory
./clone-repos.sh repos.txt ~/workspace/my-repos
```

The script will:

- Convert HTTPS URLs to SSH format automatically
- Clone each repository to the specified directory (or ~/Projects if not specified)
- Skip empty lines and comments (lines starting with #)
- Show progress for each repository being cloned

## Example repos.txt

```
# My repositories
https://github.com/username/repo
git@github.com:username/repo.git
https://github.com/company/repo
git@github.com:company/repo.git
```
