%include tau-live.ks

repo --name="tauOS Developer Experiment - Configuration" --baseurl=http://repo.tauos.co/releases/1.1
%packages

# tauOS Packages
tau-wallpapers
tau-release
tau-release-identity
tau-release-ostree-desktop
tau-repos
tau-repos-ostree
tau-gpg-keys
distrobox
file-roller
chromium
starship
tau-themes
tau-dash-to-dock
gnome-shell-extension-appindicator
tau-starship
plymouth-plugin-script

# Removed
-abrt-desktop
-desktop-backgrounds-gnome
-gnome-classic-session
-gnome-tour
-fedora-release-workstation
-fedora-workstation-backgrounds
-rhythmbox

%end

%post
# Edit fedora-welcome to use tauOS (code stolen from Ultramarine by risiOS, thanks to both
sed -i 's/Fedora/tauOS/g' /usr/share/anaconda/gnome/fedora-welcome
cat << EOF >>/home/liveuser/Desktop/liveinst.desktop
visibleName=Install tauOS
EOF