#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 copr enable -y scottames/ghostty
dnf5 install -y steam ghostty lutris nix btrfs-assistant 'https://github.com/edde746/plezy/releases/latest/download/plezy-linux-x64.rpm' 'https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm'
dnf5 copr disable -y scottames/ghostty

# Install RPM
# yum install -y 'https://github.com/edde746/plezy/releases/latest/download/plezy-linux-x64.rpm'

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
