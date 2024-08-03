# configs_wkg
This repo contains a bunch of my files for customizing stuff.

Use the scripts for copying configs to and from this repo. 
```bash
~/configs_wkg/setup.sh local # copies config files from ~configs_wkg/local/ to home directory
~/configs_wkg/setup.sh remote # copies config files from ~configs_wkg/remote/ to home directory
```

```bash
~/configs_wkg/updategit.sh local # copies config files from home directory to ~configs_wkg/local/
~/configs_wkg/updategit.sh remote # copies config files from home directory to ~configs_wkg/remote/
```

For tmux on a new machine, need to manually get tpm. Run: 
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

