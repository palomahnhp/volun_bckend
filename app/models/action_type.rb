class ActionType < ActiveRecord::Base

  enum kind: {
    publish:     1,
    unpublish:   2,
    unsubscribe: 3,
  }

end
