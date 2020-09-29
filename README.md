# GOAL

The Goal behind this is to figure out what the fastest way to scrub millions of lines of text. At its simplest, it is a matter of find and replace.

## SCRIPTS

Available are two scripts, mostly identical, except that one utilizes [concurrent.futures](https://docs.python.org/3/library/concurrent.futures.html) to handle multiprocessing and the other just lets Python work its magic.

Both scripts currently just do basic find and replace. 

## CURRENT STATUS

As it stands, based on speed tests `enumerate_multi.py` is able to scrub faster. However, when both of these scripts are put to the test against several GB's of files, most notably a few 1-2GB text files, they both fail.

`enumerate.py`fails with `killed`. It appears to be either `StackOverflow` or `OutOfMemory`. My guess is the latter based on [this stackoverflow post](https://stackoverflow.com/a/36369886).

`enumerate_multi.py` will fail _intermittently_ with `queue.Full` which points to [pipe size limits](https://stackoverflow.com/a/34035902)

## TODO:

The script that I am testing in prod utilizes a package called [scrubadub](https://scrubadub.readthedocs.io/en/stable/) which is a slightly more robust "find and replace" tool. 

I need to test what happens if I *don't* use `scrubadub` and if it still fails in the same fashion. 