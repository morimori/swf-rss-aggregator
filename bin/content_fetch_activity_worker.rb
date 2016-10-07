#! /usr/bin/env ruby

require_relative '../lib/utils'
require 'content_fetch_activity'

domain = setup_domain('example_rss_aggregator')

worker = AWS::Flow::ActivityWorker.new domain.client, domain, 'content_fetch_activity_tasklist', ContentFetchActivity
worker.start
