require_relative 'content_fetch_activity'

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

  def aggregate_rss
    fetcher.fetch
  end
end
