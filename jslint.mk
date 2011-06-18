
JSLINT := $(shell which jslint)

ifdef JSLINT
jslint: ${JS_ALL}
	@@echo "Checking JS files with JSLint"
	@@${JSLINT} ${JS_ALL}
else
jslint:
	@@echo "JSLint is not present on your system, you should: npm install jslint"
endif