require 'markup'
require "codeclimate-test-reporter"

if ENV['CODECLIMATE_REPO_TOKEN']
  CodeClimate::TestReporter.start
end