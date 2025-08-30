# Función para comprobar las diferencias entre dos archivos
check_diff() {
  local file1=$1
  local file2=$2
  local description=$3

  diff_output=$(git diff "$file1" "$file2")
  
  if [ -n "$diff_output" ]; then
    echo -e "🚨 $description tiene cambios."
  else
    echo -e "✅ El archivo $description está actualizado."
  fi
}

# Llamadas a la función check_diff para los diferentes archivos
check_diff ./configuration.nix /etc/nixos/configuration.nix "configuration.nix VS /etc/nixos/configuration.nix"
check_diff ./home.nix ~/.config/home-manager/home.nix "home.nix VS ~/.config/home-manager/home.nix"
check_diff ./dotfiles ~/.config/home-manager/dotfiles "dotfiles VS ~/.config/home-manager/dotfiles"
check_diff ./scripts ~/.config/home-manager/scripts "scripts VS ~/.config/home-manager/scripts"
check_diff ./modules ~/.config/home-manager/modules "modules VS ~/.config/home-manager/modules"
check_diff ./users /etc/nixos/users "users VS /etc/nixos/users"

