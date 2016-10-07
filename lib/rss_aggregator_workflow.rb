require 'content_fetch_activity'
require 'feed_parse_activity'
require 'entry_store_activity'

class RssAggregatorWorkflow
  extend AWS::Flow::Workflows

  workflow :aggregate_rss do
    {
      version: '1.0.0',
      task_list: 'workflow_tasklist',
      execution_start_to_close_timeout: 3600,
#      child_policy: ,
#      execution_method: ,
#      input: ,
#      tag_list: ,
#      task_priority: ,
#      task_start_to_close_timeout: ,
#      workflow_id: ,
    }
  end

  activity_client(:fetcher) { { from_class: 'ContentFetchActivity' } }
  activity_client(:parser)  { { from_class: 'FeedParseActivity' } }
  activity_client(:storage) { { from_class: 'EntryStoreActivity' } }

  def initialize
    @futures = []
  end

  def aggregate_rss
    urls.each do |url|
      futures << fetch(url)
    end
    wait_for_all futures
  end

  private
  attr_reader :futures

  def urls
    ['url1', 'url2', 'url3']
  end

  def fetch(url)
    fetcher.send_async(:fetch, url).tap do |future|
      future.on_set do
        futures << parse(future.get)
      end
    end
  end

  def parse(feed)
    parser.send_async(:parse, feed).tap do |future|
      future.on_set do
        store(future.get)
      end
    end
  end

  def store(entries)
    entries.each do |entry|
      futures << storage.send_async(:store, entry)
    end
  end
end
