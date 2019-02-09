# Vim Reminders

## Misc

| Description          | Command                     |
|----------------------|-----------------------------|
| upper/lowercase      | `gU{motion}` / `gu{motion}` |
| upper/lowercase line | `gUU` / `guu`               |

### Plugins

To remove a plugin delete the Plug line(s) from your `.vimrc`,
source it and call `:PlugClean`

## Search 

Use `\v` when searching to simplify the regex.
This could also be used when using search and replace.

| Description                    | Command                   |
|--------------------------------|---------------------------|
| search using `very-magik`      | `:/\v<regex>`             |
| search and replace with prompt | `:%s/\v<regex>/change/gc` |
| search for word under cursur   | `*` / `#`                 |

## Scrolling

| Description              | Command              |
|--------------------------|----------------------|
| scroll up\down one line  | `<C-y>` \ `<C-e>`    |
| scroll up\down half page | `<C-u>` \ `<C-d>`    |

## Folding

| Description       | Command |
|-------------------|---------|
| fold under cursor | `za`    |
| fold all          | `zM`    |
| unfold all        | `zR`    |

## Macro

| Description                  | Command        |
|------------------------------|----------------|
| start recording into `<reg>` | `:echo @<reg>` |
| display recorded macro       | `:echo @<reg>` |
| repeat the previous macro    | `@@`           |

## Marking

| Description            | Command                             |
|------------------------|-------------------------------------|
| set local/global mark  | `m<lower/upperCaseLetter>`          |
| goto local/global mark | `<backtick><lower/upperCaseLetter>` |
| show all marks         | `:marks`                            |

### Special marks

`<bt> `= ``back`tick``

| Description                                                 | Command     |
|-------------------------------------------------------------|-------------|
| jump to last change occurred in current buffer              | `<bt>.`     |
| jump to last exited current buffer                          | `<bt>"`     |
| jump to position in last file edited (when exited Vim)      | `<bt>0`     |
| like `<bt>0` but the previous file (also `<bt>2` etc)       | `<bt>1`     |
| jump back (to line in current buffer where jumped from)     | `<bt>''<bt>`|
| jump back (to position in current buffer where jumped from) | `<bt> <bt>` |

## Fugitive - git

### When editing

|  Description                        | Command           |
|-------------------------------------|-------------------|
| goto next / prev change             | `[c` / `]c`       |


### Gstatus

| Description      | Command           |
|------------------|-------------------|
| refresh (reload) | `r`               |
| show inline diff | `=`               |
| stage file       | `-`               |
| open diff        | `D` / `ds` / `dv` |
| show inline diff | `=`               |

## Multi-Cursor

| Description      | Command           |
|------------------|-------------------|
| start            | `<C-n>`           |
| next             | `<C-n>`           |
| skip             | `<C-x>`           |
| prev             | `<C-p>`           |
| select all       | `<A-n>`           |

