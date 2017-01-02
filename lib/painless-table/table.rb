require 'active_support/inflector'

module Painless
  class Table
    attr_reader :heading, :objects, :separate_rows, :cell_sizes

    def initialize parameters={}
      @heading = parameters.fetch :heading, []
      @objects = parameters.fetch :objects, []
    end

    def to_s
      draw_heading + draw_body
    end

    private

      def get_cell_widths
        widths = @heading.map { |cell| cell.size }

        get_table_values.each do |row|
          row.each_with_index do |cell, column|
            cell_size = cell.to_s.size
            widths[column] = cell_size if widths[column] < cell_size
          end
        end

        widths.map { |width| width + 2 }
      end

      def get_heading_titles
        @heading.map { |cell| cell.to_s.humanize }
      end

      def get_table_values
        rows = []

        @objects.each do |object|
          object_values = []

          @heading.each do |attribute|
            if object.methods.include? attribute.to_sym
              object_values.push object.send(attribute.to_sym).to_s
            elsif object.kind_of? Hash
              object_values.push object[attribute.to_sym].to_s
            else
              object_values.push '-'
            end
          end

          rows.push object_values
        end

        rows
      end

      def draw_borderline
        border_length = get_cell_widths.reduce( :+ ) + get_cell_widths.count + 1
        borderline = Borderline.new border_length
        borderline.to_s
      end

      def draw_heading
        heading = '|'

        get_heading_titles.each_with_index do |title, column|
          column_title = title.center(get_cell_widths[column]).concat '|'
          heading.concat column_title
        end
        heading.concat "\n"

        draw_borderline + heading + draw_borderline
      end

      def draw_body
        body = ''

        get_table_values.each do |row_with_values|
          row = '|'

          row_with_values.each_with_index do |value, column|
            cell = ' ' + value.ljust(get_cell_widths[column]-1) + '|'
            row.concat cell
          end
          row.concat "\n"

          body.concat row
        end

        body + draw_borderline
      end
  end
end
