
# wintersmith-autoprefixer-sass

[sass](http://sass-lang.com/) plugin for [wintersmith](https://github.com/jnordberg/wintersmith)
Extends [wintersmith-sass](https://github.com/imothee/wintersmith-sass) with added [Autoprefixer](https://github.com/ai/autoprefixer) support

install:

`npm install wintersmith-autoprefixer-sass -g`
then add `wintersmith-autoprefixer-sass` to your plugins in the wintersmith config

versioning:

This plugin only supports Wintersmith 2.0 or higher and requires wintersmith-sass 0.3.*

usage:

wintersmith-autoprefixer-sass requires the sass gem to be installed as it uses the sass cmd to compile the css files
Please see [sass](http://sass-lang.com/) for installation details

This plugin extends (through some admittedly dodgy way) the original wintersmith-sass plugin to provide a chained build step through autoprefixer.

If you wish to use autoprefixer with scss files in Wintersmith, simply include this plugin (and not wintersmith-sass as it is provided automatically). It uses the order of plugin loads to initiate wintersmith-sass and use the global plugins reference to extend the SassPlugin class.

If you want to have sass output a compressed file, simply add a sass variable `$compressed: true;` to each .scss or .sass file you want compressed.

If you want to have sass compile with Compass imports available, simply add a sass variable `$compass: true;` to each .scss or .sass file you want compile with Compass.

As per sass guidelines, all non partial .scss files will be parsed into a compiled css file and output. Partials, scss files beginning with _ (underscore) will be ignored unless imported.

contributors:

* JeffreyATW
