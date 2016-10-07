#! /usr/bin/env ruby

require_relative '../lib/utils'
require 'feed_parse_activity'

domain = setup_domain('example_rss_aggregator')

worker = AWS::Flow::ActivityWorker.new domain.client, domain, 'feed_parse_activity_tasklist', FeedParseActivity
worker.start
