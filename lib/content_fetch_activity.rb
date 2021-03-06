class ContentFetchActivity
  extend AWS::Flow::Activities

  activity :fetch do
    {
      version: '1.1.0',
      default_task_list: 'content_fetch_activity_tasklist',
#      default_task_heartbeat_timeout: 3600,
#      default_task_schedule_to_close_timeout: 20,
#      default_task_schedule_to_start_timeout: 20,
#      default_task_start_to_close_timeout: 20,
#      default_task_priority: 0,
#      prefix_name: 'ExampleActivity',
    }
  end

  def fetch(url)
    p url
    "#{url} feed"
  end
end
