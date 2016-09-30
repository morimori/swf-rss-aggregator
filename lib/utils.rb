require 'bundler/setup'
require 'aws/decider'

$:.unshift File.dirname(File.expand_path(__FILE__))

def setup_domain(domain_name)
  swf = AWS::SimpleWorkflow.new
  swf.domains[domain_name].tap do |domain|
    swf.domains.create(domain_name, 10) unless domain.exists?
  end
end
