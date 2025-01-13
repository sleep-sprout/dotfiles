#!/usr/bin/env zsh

set -ue

function helpmsg() {
    echo -e "Usage: $0 [options]\n"
    echo -e "Options:"
    echo -e "  -d, --debug   Enable debug mode"
    echo -e "  -h, --help    Display this help message"
    echo -e "  -l, --link    Generate symbolic links (No install package)"
}

function is_package_installed() {
    local package_name=$1

    if command -v ${package_name} >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

function install_package() {
    local package_name=$1

    if is_package_installed ${package_name}; then
        echo -e "\e[36m${package_name} is already installed.\e[m"
        return 0
    fi

    echo -e "\e[36mInstalling ${package_name}...\e[m"
    apt install -yq ${package_name}

    if is_package_installed ${package_name}; then
        echo -e "\e[36mSuccessfully installed ${package_name}.\e[m"
    else
        echo -e "\e[31mFailed to install ${package_name}.\e[0m"
        return 1
    fi
}

function install_starship() {
    if ! command -v starship >/dev/null 2>&1; then
        curl --proto '=https' --tlsv1.2 -sSf https://starship.rs/install.sh | sh -s -- -y
        echo -e "\e[36mInstalled starship\e[m\n"
    fi
}

function install_sheldon() {
    local package_name="sheldon"

    if is_package_installed ${package_name}; then
        echo -e "\e[36m${package_name} is already installed.\e[m"
        return 0
    fi

    echo -e "\e[36mInstalling ${package_name}...\e[m"
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

    if is_package_installed ${package_name}; then
        echo -e "\e[36mSuccessfully installed ${package_name}.\e[m"
    else
        echo -e "\e[31mFailed to install ${package_name}.\e[0m"
        return 1
    fi
}

function setup() {
    # check package manager (apt)
    if is_package_installed "apt"; then
        echo -e "\e[36mInstall package via: $(apt --version)\e[m\n"
    else
        echo -e "\e[31mapt package manager is not found. Please install apt.\e[0m"
        return 1
    fi

    # Install curl
    install_package "curl" || return 1

    # Install jq
    install_package "jq" || return 1

    # # Install starship
    # install_starship

    # Install sheldon
    install_sheldon
}

function generate_links() {
    local dotfiles_dir="$(cd "$(dirname "$0")" && pwd -P)"
    local backup_dir="${dotfiles_dir}/.dotbackup/backup_$(date +%Y%m%d%H%M%S)"

    echo "Backup old dotfiles into ${backup_dir}"
    mkdir -p "${backup_dir}"

    dotfile_maps="${dotfiles_dir}/link_maps.json"

    if [ ! -f "${dotfile_maps}" ]; then
        echo -e "\e[31m ${dotfile_maps} not found. \e[0m"
        return 1
    fi
    if [[ "${HOME}" == "${dotfiles_dir}" ]]; then
        echo -e "\e[31m dotfiles_dir is equal to HOME \e[0m"
        return 1
    fi

    # Generate links & backup old dotfiles
    jq -c '.[]' < "${dotfile_maps}" |
    while read dotfile_map; do
        link_src=$(echo "${dotfile_map}" | jq -r '.src')
        link_dst=$(echo "${dotfile_map}" | jq -r '.dst')
        echo -e "\e[36mTry to generate symbolic link:\e[m\n\e[36m  ${dotfiles_dir}/${link_src} -> ${HOME}/${link_dst} \e[m\n"

        if [[ -z "${link_src}" || -z "${link_dst}" ]]; then
            continue
        fi

        # Check directory
        if [[ ! -d "${HOME}/$(dirname "${link_dst}")" ]]; then
            mkdir -p "${HOME}/$(dirname "${link_dst}")"
        fi

        # Remove old links
        if [[ -L "${HOME}/${link_dst}" ]]; then
            rm -f "${HOME}/${link_dst}"
        fi

        # Backup old dotfiles
        if [[ -e "${HOME}/${link_dst}" ]]; then
            mkdir -p "${backup_dir}/$(dirname "${link_dst}")"
            mv "${HOME}/${link_dst}" "${backup_dir}/${link_dst}"
        fi

        ln -snf "${dotfiles_dir}/${link_src}" "${HOME}/${link_dst}"
    done

    # If there is no change (if backup directory is empty), remove backup directory
    if [ -d "${backup_dir}" ] && [ -z "$(ls -A "${backup_dir}")" ]; then
        rmdir "${backup_dir}"
    fi
}

function main() {
    while [ $# -gt 0 ]; do
        case ${1} in
            --debug | -d)
                set -uex
                ;;
            --help | -h)
                helpmsg
                exit 0
                ;;
            --link | -l)
                echo -e "\n\e[36mSetup [skipped]\e[m\n"
                generate_links
                echo -e "\n\e[36mLinks [ok]\e[m\n"
                echo -e "\e[1;36mInstall completed.\e[m\n"
                exit 0
                ;;
        esac
        shift
    done

    setup
    echo -e "\n\e[36mSetup [ok]\e[m\n"
    generate_links
    echo -e "\n\e[36mLinks [ok]\e[m\n"
    echo -e "\e[1;36mInstall completed.\e[m\n"
    exit 0
}

main "$@"
