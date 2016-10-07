#! /usr/bin/env ruby

require_relative '../lib/utils'
require 'entry_store_activity'

domain = setup_domain('example_rss_aggregator')

worker = AWS::Flow::ActivityWorker.new domain.client, domain, 'entry_store_activity_tasklist', EntryStoreActivity
worker.start
