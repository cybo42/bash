
function prsReviewRequested () {
  gh search prs --archived=false --state=open --review-requested=@me  \
    --json number,title,updatedAt,repository,url \
    --template '{{range .}}{{tablerow  .repository.nameWithOwner  (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt) .url }}{{end}}'
}

function prsMine () {
  gh search prs --state=open --author=@me
}

function prsMineFull () {
  gh search prs --state=open --author=@me --json number,title,createdAt,updatedAt,repository,url,state  | jq -r ".[] | [.url, .state, .title, .repository.nameWithOwner, .createdAt, .updatedAt] | @tsv "
}

function prsReviewedByMe () {
  gh search prs --archived=false --state=open --reviewed-by=@me \
    --json number,title,updatedAt,repository,url \
    --template '{{range .}}{{tablerow  .repository.nameWithOwner  (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt) .url }}{{end}}'
}

function prsLast100 () {
  gh search prs --limit 100 --sort updated --author=@me --json number,title,createdAt,updatedAt,repository,url,state |jq -r ".[] | [.url, .state, .title, .repository.nameWithOwner, .createdAt, .updatedAt] | @tsv "
}

function gh_scopes() {
  curl \
    -H "Authorization: Bearer $(gh auth token)" https://api.github.com/users/codertocat \
    -w 'authorized scopes:%header{x-oauth-scopes}\nchecked scopes:%header{x-accepted-oauth-scopes}\n' \
    -sS -o /dev/null
}
