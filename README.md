## Getting startet
This section deals with the start of the website local.
### Standard Use Case
If `mkdocs` and `mkdocs-simple-blog` is installed, you can start the website with the following command:
```sh
mkdocs serve
```
### Using the Flake
If you're in a nix driven environment, you can use the flake:
```nix
nix develop -c mkdocs serve
```
