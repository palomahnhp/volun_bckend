class EventType < ActiveRecord::Base

  enum kind: {
    activity: 1,
    project:  2
  }

end
