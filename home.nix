{pkgs, ...}: {
    home.username = "b";
    home.homeDirectory = "/home/b/.local/share/distros/lix";
    home.packages = [
        pkgs.neovim
        pkgs.hyfetch
        pkgs.oh-my-fish
        pkgs.which
        pkgs.git
        #pkgs.nixpkgs-fmt
        #pkgs.cowsay
    ];
    programs.fish = {
        enable = true;
	interactiveShellInit = ''
set fish_greeting
# eval "$(pyenv init -)"
cd
        '';
	plugins = [
	     # { name = "grc"; src = pkgs.fishPlugins.grc.src; }
	];
    };

    home.stateVersion = "22.11"; 
    programs.home-manager.enable = true;
}
