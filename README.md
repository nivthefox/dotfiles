# Jeremy's dotfiles

## Installation

### Using Git and the bootstrap script
You can clone the repository wherever you want. (I like to keep it in ```~/Projects/dotfiles```.)  The bootstrapper script will pull in the latest version and copy the files to your home folder.

```
git clone https://github.com/kkragenbrink/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, ```cd``` into your local ```dotfiles``` repository and then:

```
./boostrap.sh
```

Alternatively to update without a confirmation prompt:

```
./bootstrap.sh -f
```

### Git-free install
To install these dotfiles without Git:
```
cd; curl -#L https://github.com/kkragenbrink/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
```

To update later on, just run that command again.
