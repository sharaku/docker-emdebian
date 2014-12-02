docker-emdebian
===============

# �͂��߂�
docker�ɂ�arm�p�r���h��/EV3-LEGO�r���h����񋟂���R���e�i�ł��B  
sshd�����Ă���A�R���e�i�N�����ɐݒ肵��1���[�U�Ń��O�C���ł��܂��B  
�R���e�i��port���Ԃ���Ȃ�����A�C�ӂ̐��N���ł��܂��B  
jenkins-slave�Ƃ��Ă̗��p��z�肵�Ajava��sshd���C���X�g�[���ς݂ł��B

�܂��A�R���e�i���̃t�@�C���̓z�X�g������͊u������܂��B�i���I�ȃt�@�C���̕ۑ����K�v�ȏꍇ��-v�I�v�V�������g�p���ăz�X�g���̃f�B���N�g�����}�E���g���Ă��������B

�g����
------
# Installation
�ȉ��̂悤��docker image��pull���܂��B

    docker pull sharaku/emdebian

Docker image�������ō\�z���邱�Ƃ��ł��܂��B

    git clone https://github.com/sharaku/docker-emdebian.git
    cd docker-emdebian
    docker build --tag="$USER/emdebian" .

# Quick Start
emdebian��image�����s���܂��B

    docker run -d -e "LOGIN_USER=login_user:login_user_passwd" -p 10022:22 sharaku/emdebian

sshd�̑����/bin/bash�ŋN�����邱�Ƃ��ł��܂��B
���̏ꍇ�Aroot���[�U�ł̃��O�C���ƂȂ�܂��B

    docker run -it sharaku/emdebian /bin/bash

## Argument

+   `-v /path/to/data:/path/to/container/data:rw` :  
    �i���I�ɕۑ�����f�[�^�̃f�B���N�g�����w�肵�܂��B�C�ӂ̐���-v�I�v�V�������g�p�\�ł��B

+   `-e "LOGIN_USER=login_user:login_user_passwd"` :  
    ���O�C�����郆�[�U���A�p�X���[�h��":"�ŋ�؂��Ďw�肵�܂��B  
    ��F-e "LOGIN_USER=hogehoge:hogehoge-passwd"

+   -p port:22 :  
    �O�����J����|�[�g��ݒ肵�܂��B

# Installed environment
emdebian�R���e�i�ɂ͈ȉ����C���X�g�[���ς݂ł��B

base:debian 7.6

servers:

      sshd

build tools:

      build-essential, libtool, ncurses-dev, kmod, libproc-processtable-perl, uboot-mkimage, cppcheck
      gcc-4.4-arm-linux-gnueabi, g++-4.4-arm-linux-gnueabi

tools:

      wget, git, vim, bzip2, nkf, unzip, bc, default-jdk

���p��
------

# emdebian
�X�^���_�[�h��emdebian�Ƃ��Ďg�p����ɂ͈ȉ��̂悤�ɂ��܂��B

�ȉ��̏�����emdebian���\�z�����ł��B

+ ���[�U���Fhogehoge
+ �p�X���[�h�Fhogehoge-passwd
+ �|�[�g�F10022
+ �{�����[���i�z�X�g���j�F/var/lib/build-volume
+ �{�����[���i�R���e�i���j�F/var/lib/volume

�@

      mkdir /var/lib/build-volume

      docker run -d \
        -v /var/lib/build-volume:/var/lib/volume:rw \
        -e "LOGIN_USER=hogehoge:hogehoge-passwd" \
        -p 10022:22 sharaku/emdebian


# jenkins-slave
jenkins-slave�Ƃ��Ďg�p����ɂ͈ȉ��̂悤�ɂ��܂��B

+ ���[�U���Fjenkins
+ �p�X���[�h�Fjenkins###
+ jenkins�|�[�g�F8080
+ �|�[�g(�������p)�F10022
+ �{�����[���i�z�X�g���j�F/var/lib/jenkins-volume
+ �{�����[���i�R���e�i���j�F/var/lib/jenkins

�菇

1.�r���h���̕ۑ��̈���쐬���܂�  

      mkdir /var/lib/jenkins-volume

2.sharaku/emdebian�R���e�i���N�����܂��B  

      docker run -d \
        -v /var/lib/jenkins-volume:/var/lib/jenkins:rw \
        -e "LOGIN_USER=jenkins:jenkins###" \
        -p 10022:22 sharaku/emdebian

3.jenkins���N�����A�ݒ���s���܂��B  

      docker run -d -p 8080:8080 jenkins

4.�u���E�U����Ajenkins�֐ڑ����܂��B  
5.jenkins�̃��j���[���� `Jenkins�̊Ǘ� -> �m�[�h�̊Ǘ� -> �V�K�m�[�h�쐬` ���J���܂��B  
6. `�m�[�h��` ����͌�A`�_���X���[�u` �Ƀ`�F�b�N�����A`OK`�������܂��B  
7.`�����[�gFS���[�g`��"/var/lib/jenkins"����͂��܂��B  
8.`�N�����@`��"ssh�o�R�Ł`"��I�����܂��B  
9.`�z�X�g`�̓z�X�g��IP�������́A�h���C�����w�肵�܂��B  
10.`�F�؏��`��`add`�������A���[�U���ƃp�X���[�h��ݒ肵�܂��B  
11.`���x�Ȑݒ�`�������A`�|�[�g`�̗���10022���w�肵�܂��B  
12.`�ۑ�`�������܂��B

�ȏ�Őڑ����ł���悤�ɂȂ�܂��B
