adt = adt ? require 'adt.js'
parameterize = adt 'vec4', 'vec3', 'vec2', 'real', 'integer', 'natural', 'option', 'tolerance', 'range'
if module?.exports?
  module.exports = parameterize
