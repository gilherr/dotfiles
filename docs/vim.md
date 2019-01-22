# Vim Reminders

## Search 

Use `\v` when searching to simplify the regex.
This could also be used when using search and replace.

| Description                    | Command                   |
|--------------------------------|---------------------------|
| search using `very-magik`      | `:/\v<regex>`             |
| search and replace with prompt | `:%s/\v<regex>/change/gc` |

## Scrolling

| Description           | Command |
|-----------------------|---------|
| scroll down one line  | `<C-e>` |
| scroll up one line    | `<C-y>` |
| scroll down half page | `<C-d>` |
| scroll up half page   | `<C-u>` |

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

## Fugitive

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

