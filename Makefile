.PHONY: hypr pc install

hypr:
	tuckr rm hypr
	tuckr a -f hypr
pc:
	tuckr rm pc
	tuckr a -f pc

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
