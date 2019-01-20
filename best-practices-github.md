# Best practices: GitHub

* [GitHub Issues](#github-issues)
    * [Opening a GitHub Issue](#opening-a-github-issue)
    * [Closing a GitHub Issue](#closing-a-github-issue)
* [git commit (and push)](#github-commit-and-push)
    * [When should I commit to GitHub?](#when-should-i-commit-to-github)
    * [To which GitHub repository should I commit?](#to-which-github-repository-should-i-commit)
    * [To which repository branch should I commit?](#to-which-repository-branch-should-i-commit)
    * [Which files should I commit to the branch?](#which-files-should-i-commit-to-the-branch)
    * [How should I name files and folders I commit?](#how-should-i-name-files-and-folders-i-commit)
    * [How should commit messages be?](#how-should-commit-messages-be)
* [GitHub Pull Request](#github-pull-request)
* [GitHub Repositories](#github-repositories)
* [GitHub Projects](#github-projects)
* [If you have any doubts or comments](#if-you-have-any-doubts-or-comments)

## GitHub Issues

### Opening a GitHub Issue
We justified GitHub Issues as the main mechanism for asking questions at the [Asking Questions](asking-questions.md) section.
1. Log into GitHub by clicking on `Sign in` (if not logged in already)
1. Go to the repository that is most related from the [Repository Index](appendix/repository-index.md)
    * If it is clearly specific to one repository, go to that repository. Examples: [yarp-devices](https://github.com/roboticslab-uc3m/yarp-devices/issues), [kinematics-dynamics](https://github.com/roboticslab-uc3m/kinematics-dynamics/issues), [vision](https://github.com/roboticslab-uc3m/vision/issues)...
    * If it is extremely generic but refers to a specific robot, go to the robot's main repository. Examples: [teo-main](https://github.com/roboticslab-uc3m/teo-main/issues), [asibot-main](https://github.com/roboticslab-uc3m/asibot-main/issues)...
    * Note that TEO has its own private [teo-hardware-issues](https://github.com/roboticslab-uc3m/teo-hardware-issues/issues) repository where you can also open an issue on any specific TEO hardware issue.
    * If it extremely generic, go to: [questions-and-answers](https://github.com/roboticslab-uc3m/questions-and-answers)
1. Click on `Issues`, then on `New Issue`
1. Add an accurate title and detailed description:
    * Explain, as detailed as possible, how to reproduce the issue or the specific behaviour for the feature.
    * Include what you expected to happen and what actually happened.
    * Please include information on what operating system and version you are working with. Also add any other relevant details.
    * Remember you can use Markdown to include code fragments, bullet points, tables, etc. Don't know what Markdown is? Please read [Markdown (Spanish)](https://asrob-uc3m.gitbooks.io/tutoriales/content/writing/markdown.html)
    * Feel free to attach any other information illustrating the issue, you can drag and drop: log files, helper images, etc.
1. Click on `Submit new issue`
1. If you have permissions, assign closest related `label(s)` to the Issue.
    * Note on GitHub Issue labels: we are attempting to unify them, originally with [teo-main](https://github.com/roboticslab-uc3m/teo-main/labels) for inspiration, read more at [questions-and-answers#76](https://github.com/roboticslab-uc3m/questions-and-answers/issues/76).
1. If you have permissions, add the Issue to closest related `Project(s)`.

Troubleshooting:
- In certain repositories (none of the https://github.com/roboticslab-uc3m GitHub organization), you have to be part of the specific GitHub organization to be able to put an Issue. Please contact the specific GitHub organization owners if given the case.

### Closing a GitHub Issue
Please cite the hash of the commit that closes the GitHub Issue (ideally, the hash of a merge commit) in the closing comment.

## git commit (and push)
We have seen in [Main Developer Tools](main-developer-tools.md) that GitHub is an important part of our workflow. Now let's see when and how to use it.

### When should I commit to GitHub?
Essentially, always. Whatever you are doing, as insignificant as it may seem, please upload the files to GitHub. Read on for the details.

### To which GitHub repository should I commit?
Please use one of our repositories: [Repository Index](repository-index.md).

### To which repository branch should I commit?
Please upload your work to a new branch, branching out from `develop`. This git workflow is called [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow/).
* There is an exception, for pure documentation repos (as discussed at [\#6](https://github.com/roboticslab-uc3m/developer-manual/issues/6)), where there is no `develop` branch, so just branch out from `master` instead.

### Which files should I commit to the branch?
We commented above to commit absolutely everything, as insignificant as it may seem. There are a few exceptions, please AVOID uploading (all equally important):
* Files that can be generated via other files (executables, `.pdf`...): instead, document how to generate these files (steps for compiling/installing, `pdflatex`...)
* Compressed files (e.g. `.zip`): please upload each individual file (which can be done within the same commit)
* Big files (e.g. bibliography `.pdf`, videos...): think about more appropiate mechanisms (Mendeley, Google Drive...) and instead provide links in descriptions
* Files that are auto-generated by editor programs (e.g. editor backup files such as `.swp` or `.fcstd1`)

A useful tool to avoid uploading undesired files is [.gitignore](https://git-scm.com/docs/gitignore): adjust it for the right project type to prevent from uploading these unwanted files.

### How should I name files and folders I commit?
* Use concise and explanatory names for your files and folders.
* Place your file inside existing folders when this makes sense, and create new folders only if required.
* DON'T ADD DIGITS to filenames as a hint of a specific version, iteration step, etc. Git is a version control that manages this internally for you. Over-write an existing file when commiting a modified version of it, and create new files only if required.
* AVOID DUPLICATES of existing files: code and documentation can and should be reused ([don't repeat yourself (DRY)](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)).
* Files in `/doc` should be named using _kebab-case_.
* For C/C++ and CMake files, see specific respective conventions, below.
* As a general naming rule: be coherent with the rest of the files in that repositories (CamelCase, kebab-case, etc).
* Prefer plural in directory names at the project root: `examples`, `libraries`, `programs`, `tests`, `cmake/templates` (exception: `doc`).

### How should commit messages be?
Use a short and direct commit message that clearly states the changes made in that commit. Avoid using generic messages such as "Upload files", since they make it very hard for the repository users to track changes later on.

## GitHub Pull Request
- Whenever you feel your changes are mature enough to be merged with the main project, create a Pull Request. Your work will be reviewed and merged by the owner/admin of that repository.
- Prepend `[WIP]` (which stands for Work In Progress) in the Pull Request title if you feel the branch is still not ready for a git merge.

## GitHub Repositories
It is recommended to protect at least the following branches: `master` and `develop` (whenever it exists)

## GitHub Projects
We use GitHub Projects to manage our workflow. They offer a nice Kanban that is integrated with GitHub Issues. For columns, we define the automated basics (please preserve the first 4 and in that order!), but new can be added per repo. The chosen ones are:
1. `To do`
2. `Blocked`
3. `Waiting for 3rd party`
4. `In progress`
5. `Done`

Read more at [questions-and-answers#74](https://github.com/roboticslab-uc3m/questions-and-answers/issues/74).

## If you have any doubts or comments
Please read the [Asking Questions](asking-questions.md) section, and once you've succeded with its [self-evaluation](asking-questions.md#self-evaluation-time) follow the recommendations by commenting publicly [HERE](https://github.com/roboticslab-uc3m/developer-manual/issues/new) if required