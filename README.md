# Dotfiles 🗂️

Welcome to my dotfiles repository! 🎉 This collection contains my personal configuration files for various tools and applications, managed using [GNU Stow](https://www.gnu.org/software/stow/). These dotfiles are tailored to my workflow, but feel free to explore, adapt, or use them as inspiration for your own setup! 🚀

Repository: [https://github.com/ppablomunoz/.dotfiles](https://github.com/ppablomunoz/.dotfiles)

## Overview 📋

This repository stores configuration files (dotfiles) for tools like shell (e.g., Bash, Zsh), editors (e.g., Vim, Neovim), and other utilities. By using Stow, these configurations can be symlinked into your home directory, keeping your setup clean and version-controlled. 🛠️

## Prerequisites ✅

To use these dotfiles, you'll need the following installed:

- [Git](https://git-scm.com/) - To clone the repository 📦
- [GNU Stow](https://www.gnu.org/software/stow/) - To manage symlinks for the dotfiles 🔗
- A Unix-like operating system (Linux, macOS, WSL, etc.) 🖥️

Optional dependencies may include specific tools or applications configured by the dotfiles (e.g., Zsh, Vim, Tmux, etc.). Check the specific dotfile directories for details.

## Installation 🛠️

Follow these steps to set up the dotfiles on your system:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ppablomunoz/.dotfiles ~/.dotfiles
   ```

2. **Navigate to the dotfiles directory**:
   ```bash
   cd ~/.dotfiles
   ```

3. **Use Stow to symlink the configurations**:
   For each tool or application you want to configure, run the following command (replace `<package>` with the directory name, e.g., `zsh`, `vim`, etc.):
   ```bash
   stow <package>
   ```

   Example:
   ```bash
   stow zsh
   stow vim
   ```

   This will create symlinks in your home directory (e.g., `~/.zshrc`, `~/.vimrc`) pointing to the corresponding files in the repository. 🔗

4. **Verify the setup**:
   Ensure the symlinks are created correctly by checking your home directory:
   ```bash
   ls -la ~
   ```

## Usage ⚙️

- **Adding new dotfiles**: Place configuration files in their respective directories (e.g., `zsh/.zshrc`, `vim/.vimrc`) and use `stow <package>` to symlink them. ➕
- **Updating dotfiles**: Modify the files in the `~/.dotfiles` directory, commit changes, and push to the repository:
   ```bash
   git add .
   git commit -m "Update dotfiles"
   git push origin main
   ```
- **Removing dotfiles**: To remove a configuration, use:
   ```bash
   stow -D <package>
   ```
   This deletes the symlinks without affecting the repository files. 🗑️

## Structure 📂

The repository is organized into directories, each corresponding to a specific tool or application. For example:

```
.dotfiles/
├── zsh/
│   └── .zshrc
├── vim/
│   └── .vimrc
├── tmux/
│   └── .tmux.conf
└── README.md
```

Each directory contains the configuration files for a specific tool, and Stow symlinks them to the appropriate location in your home directory. 🗄️

## Contributing 🤝

This is a personal dotfiles repository, but suggestions or improvements are welcome! Feel free to open an issue or submit a pull request on [GitHub](https://github.com/ppablomunoz/.dotfiles). 🌟

## License 📜

This repository is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute these dotfiles as you see fit! 😄
