.PHONY: hypr pc nvim install

nvim:
	tuckr rm nvim
	tuckr a -f nvim

hypr:
	tuckr rm hypr
	tuckr a -f hypr
	hyprctl reload

pc:
	tuckr rm pc
	tuckr a -f pc
	hyprctl reload

install:
	# breaking dependency loop
	sudo pacman -R hyprland

	paru -Syyuu hyprland-git \
                hyprwire-git \
                xdg-desktop-portal-hyprland-git \
                hyprlock-git \
                hyprpicker-git \
                hyprpaper-git \
                hypridle-git \
                hyprland-qt-support-git \
                hyprpolkitagent-git \
                hyprsunset-git \
                rose-pine-hyprcursor \
                neovim-git \
                zed \
                rofi \
                ghostty \
