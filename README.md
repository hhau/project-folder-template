# Notes to self about this template folder

- `Make` controls all the things
    - Be pedantic about the `makefile`, especially as one `R` script may produce many plots and serial objects
- As a result, all `R` scripts in `scripts/` are written to be run from the top level directory

When starting out a new report:

1. `in ~/some-folder-path/PhD/Projects/`, run `mk-dated-dir a good title`
1. `cp -R 0000_project-folder-template/ yyyy-mm-dd_a-good-title/` 
1. `cd yyyy-mm-dd_a-good-title/`
1. `trash ./*/.gitignore` to get rid of the `.gitignore` files that only exist so the directory structure of this template is preserved
1. `trash ./.git` to remove this git repository and initialise one for the project
1. `trash README.md` - should only exist in the original template directory and is just notes to myself
1. Change the name of the `report-template.rmd` file to something sensible
1. Change the corresponding value of `WRITEUP` in the makefile
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

- The `report-template.rmd` file makes liberal use of `\input{tex-input/a-tex-file.tex}`, for syntax highlighting / editor reasons.
- The files here tend not to be in subdirectories (haven't written reports long enough to justify them), but I tend to name them as: `section-area-0010.tex` and the next `tex` in the subsection of the report is named `section-area-0020.tex` (because this makes it easier to come back later and add equations you forget, and I don't have any better ideas).
- The `tex-input/pre.tex` file contains all the things that `rmarkdown` / `knitr` put into the header of the resulting `report-template.tex` file