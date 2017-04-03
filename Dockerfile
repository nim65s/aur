FROM base/archlinux
RUN echo -e "[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/x86_64" >> /etc/pacman.conf
RUN pacman -Syu --noconfirm yaourt base-devel
RUN useradd -m -G wheel user
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV MAKEFLAGS "-j 8"
USER user
WORKDIR /home/user
