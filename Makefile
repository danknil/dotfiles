.PHONY: hypr pc laptop install

hypr: .install.lock
	stow -Svt $(HOME) hypr
	hyprctl reload

pc: hypr
	stow -Svt $(HOME) pc
	hyprctl reload

laptop: hypr
	stow -Svt $(HOME) laptop
	hyprctl reload


.install.lock: install
	systemctl --user --now enable hyprsunset.service
	systemctl --user --now enable hyprpaper.service
	systemctl --user --now enable hyprpolkitagent.service
	touch .install.lock

install:
	sudo pacman -R --noconfirm hyprland || true
	sudo pacman -Syyuu --noconfirm \
                ghostty \
                uwsm \
                xdg-desktop-portal-kde \
                xdg-desktop-portal-gtk \
                dolphin \
                quickshell
	yes | paru -Sa \
                hyprcursor-git \
                hyprgraphics-git \
                hypridle-git \
                hyprland-git \
                hyprland-guiutils-git \
                hyprland-protocols-git \
                hyprland-qt-support-git \
                aquamarine-git \
                hyprlang-git \
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
                runapp
