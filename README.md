# Notes to self about this template folder

- `Make` controls all the things
    - Be pedantic about the `makefile`, especially as one `R` script may produce many plots and serial objects
- As a result, all `R` scripts in `scripts/` are written to be run from the top level directory

When starting out a new report:

1. In `~/some-folder-path/PhD/Projects/`, run `mk-dated-dir a good title`
1. `cp -R 0000_project-folder-template/ yyyy-mm-dd_a-good-title/` 
1. `cd yyyy-mm-dd_a-good-title/`
1. Run `./run-me-after-copy.sh` which will:
    - `trash ./*/.gitignore` to get rid of the `.gitignore` files that only exist so the directory structure of this template is preserved
    - `trash ./.git` to remove this git repository and initialise one for the project
    - `trash README.md` - should only exist in the original template directory and is just notes to myself
    - `trash $0` delete itself
1. Change the name of the `report-template.rmd` file to something sensible
    - Change the corresponding entry in the `.gitignore` for the `.tex` file
1. Change the corresponding value of `WRITEUP` in the makefile
1. Change any other filenames containing `report-template`, `./run-me-after-copy.sh` will tell you what to change.
1. Comment in/out the relevant things in the `.gitignore`

### `Log/`

- Use `futile.logger` throughout the scripts to keep an eye on things
    - Note that there is a performance penalty for this - should not be used in tight loops

### `package/`

- Sometimes, the `scripts/common` will be insufficient, and things should really be put in an `R` package
- In this case:
    - Uncomment the relevant line in the `.gitignore`
    - Initialise a repository inside `package/packagename/`
    - Add as a submodule to the top level git repo
        - Not easy: `git submodule add ./package/pkgname/ ./package/pkgname-sub`
        - Can't avoid duping the submodule
        - At least makes it easy to make `make` depend on the submodule and then rerun everything as a result of an update
        - _Whole idea seems a little over-the-top_
    - `Make` will need to know when `git submodule update` is run (TODO: Figure this out)

### `plots/`

- Store as `.png` until one needs the `.pdf`, uses less of my time overall
- Use matching subdirectory names where possible

### `rds/`

- Dead dove do not eat
- Again try to match subdirectory names with `plots/`, and sometimes scripts

### `scripts/`

- For all varieties of scripts, usually `R`, sometimes `C++` or `sh`
- Try to use subdirectories for smaller topics
- The `scripts/common` folder exists as a kind of mid way point between one huge `R` file and a package
    - The is useful for when I'm not sure if the code will be reused, or the best way to solve some problem I am likely to preform a number of times, without introducing the nonzero amount of overhead that packages introduce (particularly with `Stan` and `C++` components that are to be reused)

### `tex-input/`

- The `report-template.rmd` file makes liberal use of `\input{tex-input/\\d{4}-a-tex-file.tex}`, for syntax highlighting / editor reasons
- The files here also tend to be in subdirectories, which I name after the section of the document
- I name the file as: `0010-appropriate-filename.tex` and the next `tex`  file in the section of the report is named `0020-another-appropriate-file.tex`
    - The label is then `(fig|eqn|tbl|alg):appropriate-filename`, so that I can easily remember the label names
        - Sometimes this conflicts because you have `tex-input/example-one/0010-stage-one-target-posterior.tex`, and `tex-input/example-two/0010-stage-one-target-posterior.tex`
        - Latex will helpfully tell you that you have nonunique labels defined
        - Append some identifier to the label? Unsure 
    - The zero padding on either side of the filename numbering is so that I can easily insert new files without renaming everything the ordering
- The `tex-input/pre.tex` file contains all the things that `rmarkdown` / `knitr` put into the header of the resulting `report-template.tex` file