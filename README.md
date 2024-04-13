# Cantara

**Hint**: This is just the repository for the source code. For general information, please consider the [webpage](https://cantara.app) with a complete documentation and instruction on downloading and installing.

**Pull Requests or issues** with bug reports, suggestions or general feedback are very appreciated!

If you like the project, please consider to *star* it on Github!

## About the program
Cantara is a simple open source song presentation software written in Free Pascal/Lazarus which allows people to spontanously present song lyrics for a bigger audience for the purpose of singing together. This is especially useful for church groups and meetings. 

![](screenshots/cantara1.png)

More pictures are in the [screenshots/](screenshots/)-Folder.

## Current Version
The current version is 2.5.0 released at August 21, 2023. Go to the [release section](https://github.com/reckel-jm/cantara/releases/tag/v2.5.0) to download the binaries for a productive use of the software.
The master branch of this repository contains the latest commits which were already tested and **should** work, but are not officially released yet. If you clone from master, you might expect bugs, misbehavior or other errors when running the application. If you find any of them, please feel free to report them as a Github issue!

Cantara is also available in the Microsoft Winget Repository, the Arch User Repository (AUR), at the snap store and on flatpak. The edge version contains the latest commit to the master branch.

[![cantara](https://img.shields.io/aur/version/cantara?color=1793d1&label=cantara&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/cantara/)
[![cantara-bin](https://img.shields.io/aur/version/cantara-bin?color=1793d1&label=cantara-bin&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/cantara-bin/)

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/cantara)
<a href='https://flathub.org/apps/details/app.cantara.Cantara'><img width='170' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-en.png'/></a>

```
winget install cantara
```
```
yay -S cantara
```
```
yay -S cantara-bin
```
```
snap install cantara
```
```
flatpak install cantara
```

## Download and Installation

There are various ways how to download and install Cantara. For a detailed explenation, please check out the docs. [In the "Releases" section of this repository](https://github.com/reckel-jm/cantara/releases) there are several binary downloads for different operating system. You can also find Cantara in the [Snap Store](https://snapcraft.io/cantara). Use the 'edge' channel to get the build from the last master commit of this repository.

If you would like to compile the latest not stable state in the master branch, you need to do the following:

 1. Download and install the [Lazarus IDE](https://www.lazarus-ide.org) – either via your distribution or their homepage.
 2. Clone the Github repository:

    `git clone git@github.com:reckel-jm/cantara.git`

 3. Open the `lazarus.lpi` file *as a project* in Lazarus and compile it **or** use `lazbuild` for the compilation via the command line:

   `lazbuild -B Cantara.lpi`

On Linux, you can change the used graphical framework via the `--ws=qt5` or `--ws=gtk2` option.

**Warning: The state of the master branch is not stable and not ready for productive use yet! If you want a stable version, please go to the [releases section](releases/).**

## Song templates
Please consult the [documentation](https://www.cantara.app/tutorial/where-to-get-the-songs/) for learning which song formats are supported and where to get songs from.

At the moment an other [GitHub Repository with public domain Christian song lyrics is under construction](https://github.com/reckel-jm/cantara_songrepo), which can be directly imported to Cantara.

## Settings
The color, background and font of the presentation can be changed in the settings.

## Contribution

A big thanks to the following users who helped improving Cantara:

* @[freundTech](https://github.com/freundTech): helping with preparing the program for flatpak
* @[primores-resugendi](https://github.com/primores-resugendi): Contributing traditional Chinese translation
* @[albanobattistella](https://github.com/albanobattistella): Contributing Italian translation
* @[haggen88](https://github.com/haggen88): Contributing Spanish translation
* @[vistaus](https://github.com/Vistaus): Contributing Dutch translation

## Licence
The program is licenced under GPL3. See [COPYING](https://github.com/reckel-jm/cantara/blob/master/COPYING) for details. You may use and change this software and it's source code and share it as you wish, but you need to add a copyright hint and keep the licence.
The file `src/exporters/templates/pptx/pptxgen.bundle.js` ist copied from the [PptxGenJS](https://github.com/gitbrent/PptxGenJS/) project and originally published by Brent Ely under [MIT license](https://github.com/gitbrent/PptxGenJS/blob/master/LICENSE).
