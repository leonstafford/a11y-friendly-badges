# a11y friendly badges for GitHub

A GitHub Action that uses information from your build to generate accessible
 project statistics. The common approach to badges lack a11y features and are
 extra bloat we don't need.

Let's do better not to exclude blind/visually-impaired users from open source!

I'll try to make this flexible enough to be usable in any projects.

## Inputs

 - `update_commands` The command used to update your README or other file

## Example usage

You define the actual rewriting functionality. This action just handles doing
 the commit for you.

```
name: Update project stats in README
on:
  push:
    branches:
      - master

jobs:
  update-code-coverage:
    runs-on: ubuntu-latest
    name: 
    steps:
    - uses: actions/checkout@master
    - name: Update version
      id: update-badges
      uses: leonstafford/a11y-friendly-badges@master
      with:
        update_commands: >
          NEW_COVERAGE="$(composer coverage | grep Cov | sed 's/Cov://' | xargs)" &&
          sed -i "s/Coverage:/c\Coverage: $NEW_COVERAGE" ./README.md
```

## Roadmap

 - store values from other steps in build to use in this action
 - override the commit message used

## Design aims

 - allow for use in any project

Original code inspired by [brettdorrans/write-version-to-file](https://github.com/brettdorrans/write-version-to-file).
