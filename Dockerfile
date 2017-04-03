FROM base/archlinux
VOLUME /var/cache/pacman/pkg/:/var/cache/pacman/pkg/
VOLUME /etc/pacman.d/:/etc/pacman.d/
RUN echo -e "[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/x86_64" >> /etc/pacman.conf
RUN pacman -Syu --noconfirm yaourt base-devel
RUN useradd -m -G wheel user
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV MAKEFLAGS "-j 8"
USER user
WORKDIR /home/user
