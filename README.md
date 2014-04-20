Git Commit Counter
=====================

One of the best ways to measure personal productivity (for me) is via Github Contributions (ie: commits). In my opinion, a commit should be a tangible task finished, or a quantifiable amount of work. Though they are different, it is nice to see how many contributions in a day have occurred.

This works by updating a system wide file on each commit. The timer then checks the length of the file for each day and will display the number of contributions that have occurred.


Usage
-----

I recommend using this [git-template](http://github.com/jonmorehouse/scripts) which has a pre-commit script which will automatically update a ~/.commits directory with the corresponding daily files.  

This overrides the `pre-commit` hook. I recommend forking git-template and adding your own functionality in there.

```
git clone https://github.com/jonmorehouse/git-template ~/.git-template
git config --global init.templatedir '~/.git-template'

# re-init repositories
git init

# now start daemon
git clone http://github.com/jonmorehouse/commit-counter
nohup commit-counter/commit-counter >/dev/null 2>&1&
```



Screenshot
----------

![Screenshot](screenshot.png)

