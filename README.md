# git-gerrit, a gerrit interface

An [ISC-licensed](LICENSE) program which allows for reviewing, downloading,
and querying a Gerrit server via SSH, from the command line.

## Requirements
- [jshon](https://github.com/keenerd/jshon)
- [git](http://git-scm.com)
- ssh
- coreutils (tr, paste, cut, wc, etc.)
- sed
- grep

## Installation
**Exherbo users, there is an exheres in ::somasis; dev-scm/git-gerrit.**

1. `git clone https://github.com/Somasis/git-gerrit` or [download a release].
2. `make`
3. `make install`

## Usage
After installation, run `man git-gerrit`. If you prefer, you can also just do
`git gerrit -h` for a non-manpage help message.

Keep in mind, that since `git-gerrit` does aim to an extent to be a
replacement for `git-review`, it actually uses `.gitreview` files for
finding where the repository's Gerrit instance is at. It is currently
compatible with the host and project parameters of `.gitreview` files, and
there's not really much reason to change it.

## Rationale
Originally, I had been using OpenStack's `git-review` for using Gerrit in a
more usable interface than plain git. However, it has a few drawbacks:

- Has one main function: pushing patches for review.
- Also can list patches, but the listing is pretty useless and is obviously
  not intended to be one of the main features of the program.
- Code-Review functionality is limited. I don't think there even is any.

In addition, I wanted to teach myself some more about how Gerrit works, and
provide for myself a nice alternative to offerings like `git-review`, and the
more interactive and full-featured `gertty`. `gertty` is also nice, but I
found it's interface to be a little confusing, and I felt like I might as well
just be using the web interface; `gertty` feels like an attempt at emulating
Gerrit's web interface in the terminal, which doesn't work well to me.

So, I set out for a few goals:

- Provide the ability to do very common functions in code reviewing, via
  a non-interactive command interface. No GUIs, no prompts.
- Don't be very dependency heavy, but don't rely on very fragile methods of
  working with Gerrit's output and `git` internals. Thus, the dependency on
  the very useful but lean program, `jshon`.
- Do not attempt to emulate the web interface, or it's oddities; create a
  new interface which does not have the drawbacks of emulations of the web
  interface. This gave it the non-interactive methods, which are modeled
  heavily after `git`'s own commands; push, log, etc.

With these in mind, I created `git-gerrit`, which aims to provide a nice
interface to Gerrit, with it's common operations in mind, that does not
attempt to entirely replace the web interface, but instead aims to let you
go between working on code and review lists of patches without interrupting
the workflow by needing web interface usage for simple tasks.

[download a release]: https://github.com/Somasis/git-gerrit/releases
