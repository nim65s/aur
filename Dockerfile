FROM base/archlinux

RUN pacman -Syu --noconfirm \
    base-devel \
    git \
 && pacman -Scc

RUN useradd -m -G wheel user \
 && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV MAKEFLAGS "-j 8"
USER user
WORKDIR /home/user

RUN git clone https://aur.archlinux.org/yay.git \
 && cd yay \
 && makepkg -si --noconfirm \
 && cd \
 && rm -rf yay \
 && yay -Scc
