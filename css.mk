
CSS_DIR ?= theme
CSS_SRC ?= ${CSS_DIR}
CSS_DIST ?= ${DIST_DIR}/${CSS_DIR}
CSS_CONCAT = ${CSS_DIST}/${PACKAGE}.css

CSS_CAT = $(addprefix ${CSS_SRC}/,${CSS})
CSS_OPT = $(addprefix ${CSS_SRC}/,${OPTIONAL_CSS})
CSS_ALL = ${CSS_CAT} ${CSS_OPT}

css: ${CSS_CONCAT}

ifdef OPTIONAL_CSS
optcss: ${CSS_DIST} ${MODE_FILE} ${CSS_OPT}
	@@echo "Copying optional CSS"
	@@echo "Build modes:" ${MODES}
	@@for f in ${OPTIONAL_CSS} ; do \
		cat ${CSS_SRC}/$$f | ${MODE_GREP} | ${SUB} > ${CSS_DIST}/$$f ; done
else
optcss:
endif

${CSS_DIST}:
	@@echo "Creating CSS directory:" ${CSS_DIST}
	@@mkdir -p ${CSS_DIST}

${CSS_CONCAT}: ${CSS_DIST} ${MODE_FILE} ${CSS_CAT}
	@@echo "Building" ${CSS_CONCAT}
	@@echo "Build modes:" ${MODES}
	@@echo "/*! ${COMMENT}: ${CSS} */" | cat - ${CSS_CAT} | ${MODE_GREP} | ${SUB} > ${CSS_CONCAT}

