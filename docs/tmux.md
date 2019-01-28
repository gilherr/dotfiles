# tmux - Terminal Multiplexer

## Useful Commands

### Run tmux

Run your terminal emulator with `<terminal> -e tmux` to autostart tmux

| Command                             	| Description                 	|
|-------------------------------------	|-----------------------------	|
| `tmux new -s myname`                	| start new with session name 	|
| `tmux a  #`  (or `at`, or `attach`) 	| attach                      	|
| `tmux a -t myname`                  	| attach to named             	|
| `tmux ls`                           	| list sessions               	|

### Session

| Command                  | Description |
|--------------------------|-------------|
| rename current session   | `$`         |

### Window

| Command         | Description |
|-----------------|-------------|
| create window   | `c`         |
| list windows    | `w`         |
| next window     | `n`         |
| previous window | `p`         |
| find window     | `f`         |
| name window     | `,`         |
| kill window     | `&`         |

### Panes (splits)

| Command                             | Description |
|-------------------------------------|-------------|
| vertical split                      | `%`         |
| horizontal split                    | `"`         |
| Resize pane in direction of <arrow> | `C-<arrow>` |
| swap panes                          | `o`         |
| show pane numbers                   | `q`         |
| kill pane                           | `x`         |
| restore pane from window            | `-`         |
| space - toggle between layouts      | ` `         |
| Move the current pane left          | `{`         |
| Move the current pane right         | `}`         |
| toggle pane zoom                    | `z`         |

### Copy mode

To start `copy mode` press `<pfx> [`.
Move around the buffer using vim controls or arrow keys.
To start selection press `<space>` and copy with `<enter>`.
You can toggle block visual mode by pressing `C-v`.
