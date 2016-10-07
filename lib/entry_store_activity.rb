class EntryStoreActivity
  extend AWS::Flow::Activities

  activity :store do
    {
      version: '1.1.0',
      default_task_list: 'entry_store_activity_tasklist',
#      default_task_heartbeat_timeout: 3600,
#      default_task_schedule_to_close_timeout: 20,
#      default_task_schedule_to_start_timeout: 20,
#      default_task_start_to_close_timeout: 20,
#      default_task_priority: 0,
#      prefix_name: 'ExampleActivity',
    }
  end

  def store(entry)
    p entry
  end
end
