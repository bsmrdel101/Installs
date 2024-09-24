# Getting Started

- Download or copy the contents of **installs.ps1**
- Open PowerShell with admin privilages and navigate to the file location of the installs.ps1 file
- Run `.\installs.ps1`

## After Running Script
- Open the settings.json in VSCode and add the following:
```json
"terminal.integrated.defaultProfile.windows": "Git Bash",
"terminal.integrated.profiles.windows": {
  "Git Bash": {
    "source": "Git Bash"
  }
},
```
- Open PowerShell
- Open `.gitconfig` in a text editor and make sure it has similar content to the following:
```ps1
...
[core]
  editor = code --wait
[diff] 
  tool = default-difftool 
[difftool "default-difftool"] 
  cmd = code --wait --diff $LOCAL $REMOTE
```
- Open `.bashrc`
- Add the following:
```ps1
if [ -t 1 ]; then
  exec zsh
fi
```

## Problems Installing Oh-My-Zsh
Try following this [tutorial](https://gist.github.com/fworks/af4c896c9de47d827d4caa6fd7154b6b?permalink_comment_id=3804105)
