# The Underbar

The Underbar is a podcast hosted by Philippe Bruhat (BooK).

Its RSS feed is at <https://underbar.cpan.io/feed.rss>,
and its official web site is at <https://underbar.cpan.io/>.

See the [About](https://underbar.cpan.io/about/) page for more details about licensing and history.

# Generating the static website

1. generate the graphic assets
   ```
   bin/build-assets $directory
   ```
2. generate the HTML and static content
   ```
   bin/build-pages $directory
   ```
3. point a webserver at `$directory`

---

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
