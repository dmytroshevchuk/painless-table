module Painless
  class Table
    class Borderline
      def initialize size
        @size = size
      end

      def to_s
        line = '-' * @size
        line + "\n"
      end
    end
  end
end
