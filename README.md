# My Neovim Config

**Requires the `neovim` python package. Which ever python project manager you use make sure it always installs the python neovim package.**

I have moved to [Lazyvim](https://github.com/folke/lazy.nvim) with all my packages managed under this framework. This should mean everything automatically installs when this repository is cloned.

## Future

The goal is to move the entire configuration over to lua. I have already moved all of my imports and keybindings all that remains are general vim settings and specific plugin settings. The latter can be moved to the Lazyvim configuration phase, or probably better to have configuration files that run after Lazy runs.

I am also looking to implement Co-pilot and Cursors like features. I am not a fan of giving everything to the Fallible Machines™ but I must admit they help with the mundane tasks.

In an ideal world I'd figure out some nice jupyter notebook, github, colab setup where I edit jupyter files in neovim using [jupynium](https://github.com/kiyoon/jupynium.nvim), only store these markdown files in github, and use the jupynium system to interact with a colab ssh. Something for the future.

## Aglaea

I still intend on creating a nicer interface with markdown files natively in neovim. Particularly better formatting/visuals. However, I feel my vision is far too much like a typesetting feature rather than a terminal feature and I think there are many existing plugins that combined do what I want.
