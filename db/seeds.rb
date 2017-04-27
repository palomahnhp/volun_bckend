[NoticeType, Req::Status, ProjectType, RequestType, EventType, UnsubscribeLevel, LinkType, Role].each do |model|
  model.kinds.each do |kind_name , kind_num|
    model.create!(id: kind_num, kind: kind_num, description: kind_name)
  end
end

# If devise_auth is false then uweb login is mandatory, otherwise devise login is mandatory
Setting['devise_auth']       = 'false'
Setting['default_country']   = 'España'
Setting['default_province']  = 'Madrid'
Setting['send_email']        = 'true'
