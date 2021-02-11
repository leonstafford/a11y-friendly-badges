# a11y friendly badges for GitHub

A GitHub Action that uses information from your build to generate accessible
 project statistics. The common approach to badges lack a11y features and are
 extra bloat we don't need.

Let's do better not to exclude blind/visually-impaired users from open source!

I'll try to make this flexible enough to be usable in any projects.


## Getting started

 - add a shell script to modify your README in `./github/update_stats/`

ie 

```sh
#!/bin/sh

# replace code coverage % in README into temp file
cat README.md | sed "/Coverage:/ c Coverage: $NEW_COVERAGE" | sed 's/\x1b\[[0-9;]*m//g' > NEWREADME.md

# overwrite README with tempfile
mv NEWREADME.md README.md
```

 - add this action within your GitHub Actions workflow:

```yaml
    - name: Update project stats
      uses: leonstafford/a11y-friendly-badges@master
```

 - add a step to do the commit with desired author/message:

```yaml
    - name: Commit files
      run: |
        git config --local user.email "me@ljs.dev"
        git config --local user.name "Leon Stafford"
        git commit -m "Update project stats" -a || echo "No project stats changes to commit"
```

 - add the [ad-m/github-push-action](https://github.com/ad-m/github-push-action) to handle the commit/push

```yaml
    - name: Push changes
      uses: ad-m/github-push-action@master
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        branch: ${{ github.ref }}
```

## Example projects with accessible badges

Inspect these for inspiration:

 - [WhatWouldViktorDo](https://github.com/leonstafford/WhatWouldViktorDo)

## Developer pain vs user-empathy

Yes, this will create extra commits in your repo. Yes, you will need to `git pull --rebase` before pushing after a README update.

Is that painful? No, not when considering the alternative is to make your badges useless for the blind/visually impaired.

Suck it up, be an empathetic engineer!

## Roadmap

 - [x] store values from other steps in build to use in this action
 - [x] override the commit message used
 - [ ] share library of common stat processing scripts
 - [ ] add some shellchecks to the mix

## Design aims

 - allow for use in any project

Original code inspired by [brettdorrans/write-version-to-file](https://github.com/brettdorrans/write-version-to-file).
