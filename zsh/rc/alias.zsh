alias python="python3"
alias pip="pip3"

# abbreviation
## cd
abbr -r "..2"="cd ../.."
abbr -r "..3"="cd ../../.."
abbr -r "..4"="cd ../../../.."
abbr -r "..5"="cd ../../../../.."

## decode jwt
abbr -g "jq jwt"="jq -rR 'split(\".\") | .[0], .[1] | @base64d | fromjson'"
