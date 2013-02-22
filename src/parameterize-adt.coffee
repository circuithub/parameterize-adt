parameterize = (adt ? require 'adt.js') 'vec4', 'vec3', 'vec2', 'real', 'integer', 'natural', 'option', 'tolerance', 'range'
if module?.exports?
  module.exports = parameterize
