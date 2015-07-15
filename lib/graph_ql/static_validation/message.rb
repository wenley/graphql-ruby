class GraphQL::StaticValidation::Message
  module MessageHelper
    def message(message, node)
      GraphQL::StaticValidation::Message.new(message, line: node.line, col: node.col)
    end
  end
  attr_reader :message, :line, :co
  def initialize(message, line: nil, col: nil)
    @message = message
    @line = line
    @col = col
  end
  def to_h
    {
      "message" => message,
      "locations" => locations
    }
  end

  private

  def locations
    @line.nil? && @col.nil ? [] : [{"line" => @line, "column" => @col}]
  end
end