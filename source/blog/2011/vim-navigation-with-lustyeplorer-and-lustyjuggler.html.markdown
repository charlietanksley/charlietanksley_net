---
title: Vim Navigation With LustyExplorer and LustyJuggler
date: 2011/10/18
tags: vim
---

There are a plethora of navigation plugins for Vim: Command-T, 
FuzzyFinder, NERDTree, and Ctrlp are all popular plugins that fit this 
description.  I've tried all these, but none of them were quite right 
for me.  I don't have any particular qualms with any of them; it's just 
  that none of them seemed quite right for me.

My favorite plugin in this space is [LustyExplorer][lustye].  
Specifically, I use the combination plugin [Lusty][lusty], which combines 
LustyExplorer (the filesystem explorer) and LustyJuggler (the buffer 
explorer).

## Why LustyExplorer?

The main reason I liked LustyExplorer was that, right off the bat, I had 
to really helpful keybindings: `<leader>lf` to open the file explorer in 
the main directory, and `<leader>lr` to open the file in the current 
directory.  So in a Rails app if I `mvim spec/models/something_spec.rb` 
I can `<leader>lf` to open the file explorer back at the application 
root.  (So `<leader>lf` then `ge<CR>` will open my Gemfile.)  But if I 
`<leader>lr` I get a file explorer opened in the `spec/models` 
directory.  Very convenient.


## The juggler

Another nice feature of the dual Lusty plugin is that you get a buffer 
explorer along with it.  By default this is bound to `<leader>lb`.  So 
when I'm working on this post and my post about emacs, I can switch to 
the other post by typing `<leader>lb em<CR>`.  Two birds, one stone 
(well, it's a combination stone...).

## The file explorer

I was inspired by Gary Bernhardt's discussion of Command-T in one of his 
[Destroy All Software screencasts][screencast].  He likes Command-T 
because he can never has to look at the names of the files he is trying 
to open: just typing `amacc<CR>` at the prompt, for example, might be 
enough information to open up `app/models/accounts.rb`, and he never has 
to look and see if he has the right file (this is his knock on 
NERDTree).  I kind of buy the knock on NERDTree---just too much 
navigating---but I don't buy it generally.  It is true that one 
difference between Command-T and LustyExplorer is that to get to 
`app/models/accounts.rb` I would have to type 
`a<tab>m<tab>acc<CR>`---LustyExplorer *does* search fuzzily, as it were, 
but it *doesn't* search recursively.  You have to type `TAB` to move 
into a subdirectory.

That seems a bit bad to me, but not **that** bad.  It isn't that bad 
because I simply cannot remember all the files I want to navigate to. :) 
I often can't remember what a given file is called, so I have to look 
anyway.  So losing recursive searching doesn't seem like too much of a 
loss to me.

One of the things I thought Bernhardt did that was really cool is 
mapping keys to open his Command-T search in certain frequently used 
directories.  Turns out you can do the same thing in LustyExplorer.  
Here are my mappings for working with Rails:

    map <leader>ff :LustyFilesystemExplorerFromHere<CR>
    map <leader>fm :LustyFilesystemExplorer app/models<CR>
    map <leader>fc :LustyFilesystemExplorer app/controllers<CR>
    map <leader>fv :LustyFilesystemExplorer app/views<CR>
    map <leader>fh :LustyFilesystemExplorer app/helpers<CR>
    map <leader>fl :LustyFilesystemExplorer lib<CR>
    map <leader>fp :LustyFilesystemExplorer public<CR>
    map <leader>fs :LustyFilesystemExplorer specs<CR>
    map <leader>ft :LustyFilesystemExplorer test<CR>

## More advanced file explorer movements

One minor complaint about LustyExplorer: the documentation is not in the 
proper file.  It shows up in the main plugin file, not in the doc file.  
This information comes from the plugin file, but it is worth repeating 
here because it is easy to overlook.

Default keybindings:

    <Leader>lf  - Opens the filesystem explorer.
    <Leader>lr  - Opens the filesystem explorer from the
                  directory of the current file.
    <Leader>lb  - Opens the buffer explorer.
    <Leader>lg  - Opens the buffer grep, for searching through
                  all loaded buffers

Navigating within the prompt/quickfix window:

    <Enter>  open selected match
    <Tab>    open selected match
    <Esc>    cancel
    <C-c>    cancel
    <C-g>    cancel

    <C-t>    open selected match in a new [t]ab
    <C-o>    open selected match in a new h[o]rizontal split
    <C-v>    open selected match in a new [v]ertical split

    <C-n>    select [n]ext match
    <C-p>    select [p]revious match
    <C-f>    select [f]orward one column
    <C-b>    select [b]ack one column
    
    <C-u>    clear prompt


[lusty]:[https://github.com/sjbach/lusty]
[lustye]:[http://www.vim.org/scripts/script.php?script_id=1890]
[screencast]:[https://www.destroyallsoftware.com/screencasts/catalog/file-navigation-in-vim]
