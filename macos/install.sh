# ------------ Install Homebrew + apps
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

formulae=(
    git         
    nvm         
    ack         
    grep        # to use GNU grep, either use ggrep OR add it to path PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
    watch       
    jq          # cli json parser
    tldr        # man for lazy people - tldr <cmd>
    k9s         
    jfrog-cli
    telnet
    go@1.19
    coreutils   # https://formulae.brew.sh/formula/coreutils
    # fd
    # macvim
)

brew install "${formulae[@]}"

casks=(
    --cask docker
    --cask iterm2
    --cask sdm
    --cask lens
    --cask jetbrains-toolbox
    # --cask alt-tab                # Enable Windows-like alt-tab
    # --cask spotify                # Music streaming service
    # --cask alfred                 # Application launcher and productivity software
    # --cask dbeaver-community      # dbeaver - database viewer
    # --cask maccy                  # clipboard manager (clipboard history)
    # --cask postman                # http requests UI client
    # --cask shottr                 # screenshot tool
    # --cask karabiner-elements     # keys re-mapping (get your ~ back in the right place)
    # --cask unnaturalscrollwheels  # fix mouse scroll direction
    # --cask logseq                 # Note taking tool
    # --cask easy-move-plus-resize  # Move and resize windows using a modifier key and mouse drag
)

brew install "${casks[@]}"


# ------------ Install oh-my-zsh and its plugin (autosuggestion, syntax highlighting, powerlevel10k - pretty propmt)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# ------------ Insall FZF - fuzzy search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all


# ------------ Iterm2 shell integration
curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
# echo "source ~/.iterm2_shell_integration.zsh" >> ~/.zshrc

# ---------- Configuration

# Disable press and hold (for accented chars) to allow vim's hjkl continues movement
defaults write -g ApplePressAndHoldEnabled -bool false

## Git
### avoid running "--set-upstream" when creating new branches
git config --global --add --bool push.autoSetupRemote true 

## Iterm option+. to insert-last-word
# https://superuser.com/a/1166260

## Custom shortcuts for any menu item
# https://www.intego.com/mac-security-blog/how-to-make-custom-keyboard-shortcuts-for-any-macos-menu-items-and-to-launch-your-favorite-apps/

## Docker issue - keeps stopping
# https://github.com/docker/for-mac/issues/6472#issuecomment-1236883870
alias diewhale='pkill Docker && sleep 5 && open /Applications/Docker.app'

## Move window with ctrl+cmd+click (https://apple.stackexchange.com/a/365860)
# defaults write -g NSWindowShouldDragOnGesture -bool true 
# To turn off:
# defaults delete -g NSWindowShouldDragOnGesture

