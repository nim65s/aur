FROM archlinux/archlinux:base-devel

RUN pacman -Sy --noconfirm \
    git \
 && pacman -Scc

RUN useradd -m -G wheel user \
 && echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV MAKEFLAGS="-j4" CTEST_OUTPUT_ON_FAILURE=1
USER user
WORKDIR /home/user

RUN git clone https://aur.archlinux.org/paru-bin.git \
 && cd paru-bin \
 && makepkg -si --noconfirm \
 && cd \
 && rm -rf paru-bin \
 && paru -Scc

RUN mkdir -p ~/.gnupg/public-keys \
 && curl \
    https://github.com/jcarpent.gpg \
    https://github.com/jorisv.gpg \
    https://github.com/manifoldfr.gpg \
    https://github.com/nim65s.gpg \
    https://github.com/proyan.gpg \
  | gpg --import
