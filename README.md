# Screenshot

This is a simple bash to create a screenshots with `zenity` and `scrot`.

## Requirements

To use screenshot, the requirements are:

- zenity.
- scrot

## Installing

To install screenshot, use this:

```sh
mkdir -p ~/repo
cd ~/repo
git clone https://github.com/AlphaTechnolog/screenshot.git
```

## Mounting on spectrwm

If you use spectrwm, please see this:

```sh
cd ~/.config/spectrwm
nvim spectrwm.conf # nvim or nano or vi or vim or gedit or...
```

```conf
program[screenshot] = /home/YOURUSER/repo/screenshot/screenshot.sh
bind[screenshot]    = MOD-s # Or your bind
```

## Mounting on qtile

If you use qtile, please see this:

```sh
cd ~/.config/qtile
nvim config.py
```

```python
# ...
from libqtile.config import Key
from libqtile.command import lazy

mod = 'mod4'

keys = [Key(key[0], key[1], *key[2:]) for key in [
  # ...
  ([mod], 's', lazy.spawn("/home/YOURUSER/repo/screenshot/screenshot.sh"))
]]
```

## Mounting on dwm

If you use dwm, please see this:

```sh
cd ~/.config/dwm
nvim config.h
```

```c
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#include <X11/XF86keysym.h>
static Key keys[] = {
  // ...
  { MODKEY, XK_s, spawn, SHCMD("/home/YOURUSER/repo/screenshot/screenshot.sh") }
};
```

## Mounting on xmonad

If you use xmonad, please see this:

```sh
cd ~/.xmonad
nvim xmonad.hs
```

```haskell
myKeys :: [(String, X ())]
myKeys = 
    [
    -- ...
    ("M-s", spawn "/home/YOURUSER/repo/screenshot/screenshot.sh"),
    ]
```

## Learning to use it

Using screenshot.sh. Exists two methods.
The first method... If you mounted on `dwm`, `qtile`, `spectrwm`, or `xmonad`.
Now you must use the bind specified, in my
computer is: `M-s` the `Meta` key (in most computers
is the `Windows Icon` key). If you not use `dwm`, `qtile`, `spectrwm` or `xmonad`.
Use it using the script, exec this:

```sh
cd ~/repo/screenshot
./screenshot.sh # This launch the script!
```

## Enjoy

Thanks for use screenshot!
