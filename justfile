sync:
    # remove current content
    rm -rf content

    # copy new content
    cp -r "$HOME/Desktop/🧠 Brain" content

prepare: sync
    # delete templates and meta files
    rm -rf "content/🎪 Random" "content/.obsidian"


    # flatten
    cd content; find . -type f -exec sh -c 'mv "$@" . 2>/dev/null || true' _ {} +
    rm -rf "content/📥 Inbox" "content/📦 Archive"

    # parse files
    hugo-obsidian -input=content -output=data -index=true

serve: prepare
    hugo server

build: prepare
    hugo

upload: prepare
    git add .
    git commit -m "Chore: daily" --no-gpg-sign
    git push
