SRC_NIX="./configuration.nix"
DST_NIX="/etc/nixos/configuration.nix"

SRC_HOME="./home.nix"
DST_HOME="$HOME/.config/home-manager/home.nix"

MODULES_DIR="./modules"
USERS_DIR="./users"

DOTFILES_DIR="./dotfiles"
SCRIPTS_DIR="./scripts"

HOME_MANAGER_DIR="$HOME/.config/home-manager"
NIXOS_DIR="/etc/nixos"

changed_nixos=false
changed_home=false

compare_and_copy() {
  local src="$1"
  local dst="$2"
  local flag_var="$3"

  if ! diff -r "$src" "$dst" &>/dev/null; then
    echo -e "🚨 Diferencias detectadas entre $src y $dst"
    diff -r "$src" "$dst" || true
    if [[ "$dst" == /etc/* ]]; then
      sudo cp -r "$src" "$dst"
    else
      cp -r "$src" "$dst"
    fi
    eval "$flag_var=true"
  else
    echo -e "✅ $dst está actualizado respecto a $src"
  fi
}

compare_and_copy "$SRC_NIX" "$DST_NIX" changed_nixos
compare_and_copy "$MODULES_DIR" "$NIXOS_DIR/modules" changed_nixos
compare_and_copy "$USERS_DIR" "$NIXOS_DIR/users" changed_nixos

if $changed_nixos; then
  echo -e "🔧 Aplicando cambios de NixOS..."
  sudo nixos-rebuild switch
fi

compare_and_copy "$SRC_HOME" "$DST_HOME" changed_home
compare_and_copy "$DOTFILES_DIR" "$HOME_MANAGER_DIR/dotfiles" changed_home
compare_and_copy "$SCRIPTS_DIR" "$HOME_MANAGER_DIR/scripts" changed_home

if $changed_home; then
  echo -e "🔧 Aplicando cambios de Home Manager..."
  home-manager switch
fi

if ! git diff --quiet || ! git diff --cached --quiet; then
  git add .
  git commit -m "new generation"
fi
