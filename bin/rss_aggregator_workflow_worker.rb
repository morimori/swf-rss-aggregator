#! /usr/bin/env ruby

require_relative '../lib/utils'
require 'rss_aggregator_workflow'

domain = setup_domain('example_rss_aggregator')

worker = AWS::Flow::WorkflowWorker.new domain.client, domain, 'workflow_tasklist', RssAggregatorWorkflow
worker.start
