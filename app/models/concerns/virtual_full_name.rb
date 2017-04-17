module VirtualFullName

  extend ActiveSupport::Concern

  included do
    # Virtual column to search text in three columns as they were only one column named :full_name
    ransacker :full_name, formatter: proc { |v| v.squeeze(' ') }  do |parent|
      Arel::Nodes::InfixOperation.new(
        '||',
        Arel::Nodes::InfixOperation.new(
          '||',
          Arel::Nodes::InfixOperation.new(
            '||',
            Arel::Nodes::InfixOperation.new(
              '||',
              parent.table[:name],
              Arel::Nodes.build_quoted(' ')
            ),
            parent.table[:last_name]
          ),
          Arel::Nodes.build_quoted(' ')
        ),
        parent.table[:last_name_alt]
      )
    end
  end

end