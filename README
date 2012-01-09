# Build System

A make based build system for JavaScript projects.

## Features

* Concatenation of JavaScript and CSS modules.
* String substitution of `@VERSION` (from `version.txt`) and `@DATE`.
* Copy optional JS/CSS modules into dist (including string substitution).
* Copy extra files into dist.
* Conditional Comments.

Bonus:
    
* Checking of JavaScript files using jslint (if installed through: `npm install jslint`).
* Minification using UglifyJS (if installed through: `npm install uglify-js`).

## Requirements:
 * Make
 * GNU/Posix like environment (echo, cat, sed, mkdir, rm, grep, etc.)
 * Java — for YUICompressor
 * node — for jslint/UglifyJS

## Adding it to your project

1. Import the whole directory to a sub-dir of your project. 
```
git submodule add git://github.com/jollytoad/js-common-build.git build
```

2. Create a `version.txt` file containing the version number of the project.
 NOTE: ensure the file doesn't end with a line-break.

3. Create a Makefile based on the following example:
```
PACKAGE = jquery-roles

MODULES = \
   roles.core.js \
	roles.aria.js \
	roles.tablist.js \
	roles.tree.js

OPTIONAL_MODULES = \
	roles.ie6css.js \
	roles.uicss.js

EXTRAS = \
	theme

include build/rules.mk
```

## Usage

To jslint and build everything run:
```
make
```

Common make targets are:

* `all` - perform the jslint, build and minify targets
* `jslint` - to run jslint over all `MODULES` and `OPTIONAL_MODULES`
* `build` - performs `js`, `optjs`, `extras`, `css`, and `optcss`
* `js` - concatenate all JS files listed `MODULES` and perform string substitutions, creates `DIST_DIR/PACKAGE.js`
* `optjs` - copy `OPTIONAL_MODULES` into `DIST_DIR`, performing substitutions
* `extras` - copies `EXTRAS` into `DIST_DIR`
* `css` - concatenate all CSS files listed in CSS and perform string substitutions, creates `CSS_DIST/PACKAGE.css`.
* `optcss` - copy `OPTIONAL_CSS` into `CSS_DIST`, performing substitutions
* `minify` - minify the JS files into `MIN_DIR` using UglifyJS
* `clean` - remove the `DIST_DIR`

Example, to build without a jslint check or minifying:
```
make build
```

### Optional variables

You may also set any of the following variables in the Makefile:

* `SRC_DIR` - the source directory (default: `src`)
* `BUILD_DIR` - the build system dir (default: `build`)
* `DIST_DIR` - the distribution dir - where everything ends up (default: `dist`)
* `MIN_DIR` - where to put minified files (default: `${DIST_DIR}/min`)
* `OPTIONAL_MODULES`, `EXTRAS` - these can be removed if there are none
* `COMMENT` - a short comment added to the top of concatenated file, prefixing the list of module names: `/*! COMMENT: MODULES */`
* `MODE_FILE` - the file containing the list of conditional comments to remove (default: `mode`)
* `CSS`, `OPTIONAL_CSS` - CSS files to concatenate and copy respectively
* `CSS_DIR` - subdirectory containing the CSS files (default: `theme`)
* `CSS_SRC` - CSS source directory (default: `${CSS_DIR}`)
* `CSS_DIST` - destination for CSS files (default: `${DIST_DIR}/${CSS_DIR}`)

## Conditional Comments

There is also support for simple conditional comments, that allow sections of code to be included at build time.
It works by removing any lines that contain a string from the `MODE_FILE`.

Examples of use in the source code:

```javascript
    for (var prop in obj) {

/*SAFE*
        if ( !obj.hasOwnProperty(prop) ) { continue; }
*SAFE*/

/*DEBUG*
        console.log(obj, prop);
*DEBUG*/

        ...
    }
Then in the MODE_FILE:

*DEBUG*
*SAFE*
```