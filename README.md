# Python Virtual Environment Merger

Utility to link packages from different Python virtual environments to your current one.<br>

## Requisites

- Python 3+
- Bash or Zsh

<hr />

## Usage

First, activate the virtual environment you want packages to be added to.<br>
Then, as arguments, give the absolute paths of the environments whose packages you want in the current environment.

```
envmerger <absolute paths to virtual environments>
```

Once this is done, you are good to go! These packages will last as long as the shell instance is open. Once the shell is closed, or you open a new shell, your virtual environment will go back to accessing only its native packages.<br>

To remove all packages from external environments, you can also do:

```
envmerger clean
```

## Installation

First clone the repo:

```
git clone https://github.com/KulkarniKaustubh/PythonVenvMerger.git
```

Next change directory to the cloned repo and run the installation script:

```
cd PythonVenvMerger
./install.sh
```
>The above commands can be used to update the already installed **envmerger** as well

Now you are ready to use **envmerger**!

## Help Menu

To bring up the help menu:

```
envmerger -h
```
OR
```
envmerger --help
```

## Uninstallation

To uninstall, go to the cloned repo and run the uninstallation script:

```
./uninstall.sh
```

<hr />

## TODO

- [ ] Add the names of the venvs that are linked, to the shell prompt
