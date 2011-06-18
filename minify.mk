
MIN_DIR ?= ${DIST_DIR}/min

UGLIFYJS := $(shell which uglifyjs)

MIN_FILES = $(notdir ${JS_CONCAT}) ${OPTIONAL_MODULES}
MIN_OUT = $(addprefix ${MIN_DIR}/,$(patsubst %.js,%.min.js,${MIN_FILES}))

ifdef UGLIFYJS
minify: ${MIN_OUT}
else
minify:
	@@echo "UglifyJS is not presetn on your system, you should: npm install uglify-js"
endif

${MIN_DIR}:
	@@echo "Creating minify directory:" ${MIN_DIR}
	@@mkdir -p ${MIN_DIR}

${MIN_OUT}: js optjs ${MIN_DIR}
	@@echo "Minifying" $@
	@@${UGLIFYJS} -o $@ $(addprefix ${DIST_DIR}/,$(notdir $(patsubst %.min.js,%.js,$@)))

