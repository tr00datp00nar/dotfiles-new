My configuration files for Linux.

# Prerequisites

- pip3
- git

## pip3

```sh
sudo apt install python3 python3-pip
```

## git

```sh
sudo apt install -y git
```

# Clone the repository

```sh
git clone git@github.com:tr00datp00nar/dotfiles-new.git
```

```sh
cd dotfiles-new
```

# Install Ansible Using pip3

- Installs both ansible and everything defined in `requirements.yml`

```sh
./install
```

# Run playbook

- Bootstraps a new system with common applications, settings, and dotfiles.

```sh
ansible-playbook -i hosts --ask-become-pass bootstrap.yml
```

# Role specific variables

Some of the roles install or configure specific versions of tools or applications. Check the `vars/main.yml` located within each role to change any of the role specific variables.

# TODO

- Configurations
  - [ ] zsh
  - [ ] tmux
  - [ ] nvim
  - [ ] catppuccin GTK theme
- Applications
  - [ ] ulauncher
  - [ ] brave browser
  - [ ] psensor
- Dev Tools
  - [ ] go

# Resources

- https://phelipetls.github.io/posts/introduction-to-ansible/#dotfiles-use-cases
- https://github.com/phelipetls/dotfiles
