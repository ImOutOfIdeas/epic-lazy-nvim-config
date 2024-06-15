 My Epic lazy.nvim Config
==========================
A fairly simple nvim config that I use daily. 

 Setup
-------
1. [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Download the latest release tar.gz
3. Move the nvim directory to ~/.config/
4. Run Nvim and enjoy!

&nbsp;

 After Installation
--------------------
1. Use the MasonInstall command to add any lsp's you may need
2. Install a [patched font](https://www.nerdfonts.com/font-downloads) so the NvimTree icons work

&nbsp;

 Custom Bindings
-----------------
All bindings can be changed in their config files. The following are only the binds I modified. Refer to the respective documentation for the others.

(Note: An underscore "_" means space and C-[Letter] means Ctrl+Letter)

&nbsp;

### [NvimTree](https://github.com/nvim-tree/nvim-tree.lua) (Strongly recommend a [patched font](https://www.nerdfonts.com/font-downloads) to properly display icons)
| Command | Description |
| :-----: | :---------- |
| _-e      | Toggles NvimTree open and closed |

### [Harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
| Command | Description |
| :-----: | :---------- |
| _-a     | Appends current file to harpoon list |
| C-e     | Opens/Closes the harpoon list |
| C-[1-6] | Opens up respective file in harpoon list | 
| C-k     | Move to previous file in harpoon list |
| C-j     | Move to next file in harpoon list |

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)
| Command | Description |
| :-----: | :---------- |
| _ff     | Searches files by name in the current directory |
| _fg     | Live greps within files in the current directory |
| _fb     | Search through all open buffers |
| _fh     | Search through all help tags |

