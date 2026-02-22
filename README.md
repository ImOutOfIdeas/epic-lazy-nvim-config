<div align="center">

### My Epic lazy.nvim Config
A fairly simple nvim config that I use daily.

</div>

---

## 🚀 Setup

1. [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Download the latest release tar.gz
3. Move the nvim directory to `~/.config/`
4. Run Nvim and enjoy!

&nbsp;

## ✅ After Installation

1. Use the `MasonInstall` command to add any LSPs you may need
2. Install a [patched font](https://www.nerdfonts.com/font-downloads) so the NvimTree icons work

---

## ⌨️ Custom Bindings

All bindings can be changed in their config files. The following are only the binds I modified. Refer to the respective documentation for the others.

> **Note:** `_` means `Space` and `C-[Letter]` means `Ctrl + Letter`

&nbsp;

### [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
> Strongly recommend a [patched font](https://www.nerdfonts.com/font-downloads) to properly display icons

| Command | Description |
| :-----: | :---------- |
| `_ e` | Toggles NvimTree open and closed |

&nbsp;

### [Harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)

| Command | Description |
| :-----: | :---------- |
| `_ a` | Appends current file to harpoon list |
| `C-e` | Opens/Closes the harpoon list |
| `C-[1-6]` | Opens up respective file in harpoon list |
| `C-k` | Move to previous file in harpoon list |
| `C-j` | Move to next file in harpoon list |

&nbsp;

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

| Command | Description |
| :-----: | :---------- |
| `_ ff` | Searches files by name in the current directory |
| `_ fg` | Live greps within files in the current directory |
| `_ fb` | Search through all open buffers |
| `_ fh` | Search through all help tags |

&nbsp;

### [i3](https://i3wm.org)-style Keybinds
> `Alt` is the modifier key, mirroring i3's `$mod`

#### Splits

| Keybind | Action |
| :-----: | :----- |
| `Alt + v` | Vertical split |
| `Alt + s` | Horizontal split |
| `Alt + x` | Close split (keep buffer) |
| `Alt + o` | Close all other splits |
| `Alt + =` | Equalize splits |

#### Focus

| Keybind | Action |
| :-----: | :----- |
| `Alt + h` | Focus left |
| `Alt + j` | Focus down |
| `Alt + k` | Focus up |
| `Alt + l` | Focus right |

#### Resize Mode

| Keybind | Action |
| :-----: | :----- |
| `Alt + r` | Toggle resize mode |
| `h / j / k / l` | Resize (while in resize mode) |
| `Esc` | Exit resize mode (also clears search highlight) |

#### Move Buffers

| Keybind | Action |
| :-----: | :----- |
| `Alt + Shift + h` | Move buffer left one position |
| `Alt + Shift + j` | Move buffer down one position |
| `Alt + Shift + k` | Move buffer up one position |
| `Alt + Shift + l` | Move buffer right one position |

#### Buffers (Workspaces)

| Keybind | Action |
| :-----: | :----- |
| `Alt + 1-9` | Jump to buffer N |
| `Alt + Tab` | Next buffer |
| `Alt + Shift + Tab` | Previous buffer |
| `Alt + q` | Close buffer |

#### Other

| Keybind | Action |
| :-----: | :----- |
| `Alt + d` | Find file (Telescope) |
| `Alt + t` | Open / close terminal |
