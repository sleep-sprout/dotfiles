# iceberg color palette
typeset PALETTE_COLOR_BLACK="#1E2132"           # 0
typeset PALETTE_COLOR_RED="#E27878"             # 1
typeset PALETTE_COLOR_GREEN="#B4BE82"           # 2
typeset PALETTE_COLOR_YELLOW="#E2A478"          # 3
typeset PALETTE_COLOR_BLUE="#84A0C6"            # 4
typeset PALETTE_COLOR_PURPLE="#A093C7"          # 5
typeset PALETTE_COLOR_CYAN="#89B8C2"            # 6
typeset PALETTE_COLOR_WHITE="#C6C8D1"           # 7
typeset PALETTE_COLOR_BRIGHT_BLACK="#6B7089"    # 8
typeset PALETTE_COLOR_BRIGHT_RED="#E98989"      # 9
typeset PALETTE_COLOR_BRIGHT_GREEN="#C0CA8E"    # 10
typeset PALETTE_COLOR_BRIGHT_YELLOW="#E9B189"   # 11
typeset PALETTE_COLOR_BRIGHT_BLUE="#91ACD1"     # 12
typeset PALETTE_COLOR_BRIGHT_PURPLE="#ADA0D3"   # 13
typeset PALETTE_COLOR_BRIGHT_CYAN="#95C4CE"     # 14
typeset PALETTE_COLOR_BRIGHT_WHITE="#D2D4DE"    # 15

# Powerlevel10k color setting
## OS icon
typeset -g SEGMENT_COLOR_OS_ICON_FG=${PALETTE_COLOR_WHITE}
typeset -g SEGMENT_COLOR_OS_ICON_BG=${PALETTE_COLOR_BLACK}

## prompt
typeset -g SEGMENT_COLOR_PROMPT_OK_FG=${PALETTE_COLOR_BLUE}
typeset -g SEGMENT_COLOR_PROMPT_ERROR_FG=${PALETTE_COLOR_RED}
typeset -g SEGMENT_COLOR_PROMPT_CONTINUATION_FG=${PALETTE_COLOR_BRIGHT_BLACK}

typeset -g SEGMENT_COLOR_PROMPT_FILL_FG=${PALETTE_COLOR_BRIGHT_BLACK}

## directory
typeset -g SEGMENT_COLOR_DIR_FG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_DIR_SHORTENED_FG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_DIR_ANCHOR_FG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_DIR_BG=${PALETTE_COLOR_BLUE}

## VCS (git)
typeset -g SEGMENT_COLOR_VCS_CLEAN_BG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_VCS_MODIFIED_BG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_VCS_UNTRACKED_BG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_VCS_CONFLICTED_BG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_VCS_LOADING_BG=${PALETTE_COLOR_BLACK}

typeset -g SEGMENT_COLOR_VCS_META_FG=${PALETTE_COLOR_GREEN}
typeset -g SEGMENT_COLOR_VCS_CLEAN_FG=${PALETTE_COLOR_YELLOW}
typeset -g SEGMENT_COLOR_VCS_MODIFIED_FG=${PALETTE_COLOR_GREEN}
typeset -g SEGMENT_COLOR_VCS_UNTRACKED_FG=${PALETTE_COLOR_YELLOW}
typeset -g SEGMENT_COLOR_VCS_CONFLICTED_FG=${PALETTE_COLOR_BRIGHT_BLACK}

typeset -g SEGMENT_COLOR_VCS_ICON_FG=${PALETTE_COLOR_BLUE}

## status
typeset -g SEGMENT_COLOR_STATUS_OK_FG=${PALETTE_COLOR_GREEN}
typeset -g SEGMENT_COLOR_STATUS_OK_BG=${PALETTE_COLOR_BLACK}

typeset -g SEGMENT_COLOR_STATUS_OK_PIPE_FG=${PALETTE_COLOR_GREEN}
typeset -g SEGMENT_COLOR_STATUS_OK_PIPE_BG=${PALETTE_COLOR_BLACK}

typeset -g SEGMENT_COLOR_STATUS_ERROR_FG=${PALETTE_COLOR_RED}
typeset -g SEGMENT_COLOR_STATUS_ERROR_BG=${PALETTE_COLOR_BLACK}

typeset -g SEGMENT_COLOR_STATUS_ERROR_SIGNAL_FG=${PALETTE_COLOR_RED}
typeset -g SEGMENT_COLOR_STATUS_ERROR_SIGNAL_BG=${PALETTE_COLOR_BLACK}

typeset -g SEGMENT_COLOR_STATUS_ERROR_PIPE_FG=${PALETTE_COLOR_RED}
typeset -g SEGMENT_COLOR_STATUS_ERROR_PIPE_BG=${PALETTE_COLOR_BLACK}

## command execution time
typeset -g SEGMENT_COLOR_COMMAND_EXECUTION_TIME_FG=${PALETTE_COLOR_YELLOW}
typeset -g SEGMENT_COLOR_COMMAND_EXECUTION_TIME_BG=${PALETTE_COLOR_BLACK}

## background job
typeset -g SEGMENT_COLOR_BACKGROUND_JOBS_FG=${PALETTE_COLOR_CYAN}
typeset -g SEGMENT_COLOR_BACKGROUND_JOBS_BG=${PALETTE_COLOR_BLACK}

## kubecontext
typeset -g SEGMENT_COLOR_KUBECONTEXT_FG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_KUBECONTEXT_BG=${PALETTE_COLOR_PURPLE}

## aws
typeset -g SEGMENT_COLOR_AWS_FG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_AWS_BG=${PALETTE_COLOR_RED}

## azure
typeset -g SEGMENT_COLOR_AZURE_FG=${PALETTE_COLOR_BLACK}
typeset -g SEGMENT_COLOR_AZURE_BG=${PALETTE_COLOR_BLUE}

## time
typeset -g SEGMENT_COLOR_TIME_FG=${PALETTE_COLOR_WHITE}
typeset -g SEGMENT_COLOR_TIME_BG=${PALETTE_COLOR_BLACK}