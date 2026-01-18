.PHONY: hypr pc nvim laptop install

nvim:
	tuckr rm nvim
	tuckr a -f nvim

hypr:
	tuckr rm hypr
	tuckr a -f hypr
	hyprctl reload

pc: hypr nvim
	tuckr rm pc
	tuckr a -f pc
	hyprctl reload

laptop: hypr nvim
        tuckr rm laptop
        tuckr a -f laptop
        hyprctl reload

install:
	# breaking dependency loop
	sudo pacman -R --noconfirm hyprland

        sudo pacman -Syyuu --noconfirm \
                zed \
                ghostty \
                uwsm \
                xdg-desktop-portal-kde \
                xdg-desktop-portal-gtk \
                dolphin \

	paru -Sa \
                hyprcursor-git \
                hyprgraphics-git \
                hypridle-git \
                hyprland-git \
                hyprland-guiutils-git \
                hyprland-protocols-git \
                hyprland-qt-support-git \
                aquamarine-git \
                hyprlang-git \
                hyprlock-git \
                hyprpaper-git \
                hyprpicker-git \
                hyprpolkitagent-git \
                hyprshutdown-git \
                hyprsunset-git \
                hyprtoolkit-git \
                hyprutils-git \
                hyprwayland-scanner-git \
                hyprwire-git \
                rose-pine-hyprcursor \
                xdg-desktop-portal-hyprland-git \
                neovim-git \
                runapp \
