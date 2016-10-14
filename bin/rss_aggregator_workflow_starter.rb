#! /usr/bin/env ruby

require_relative '../lib/utils'
require 'rss_aggregator_workflow'

domain = setup_domain('example_rss_aggregator')

client = AWS::Flow::workflow_client(domain.client, domain) { { from_class: 'RssAggregatorWorkflow' } }
client.start_execution(ENV['FEED_LIST_URL'])
