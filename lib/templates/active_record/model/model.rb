<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>

<%- if attributes.find{ |attr| /\Aname\Z/ =~ attr.name } -%>
  def to_s
    name
  end
<%- end -%>

end
<% end -%>