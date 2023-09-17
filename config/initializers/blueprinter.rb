# frozen_string_literal: true

require 'oj'

Blueprinter.configure do |config|
  config.generator = Oj
  config.datetime_format = '%Y-%m-%dT%H:%M:%S.%L%z'
end
