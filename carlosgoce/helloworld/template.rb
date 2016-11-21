module Rodolfo
  # carlosgoce/helloworld
  # Rodolfo Hello World recipe
  class Template < Prawn::Document
    def initialize(data, options = {})
      @data = data
      super page_size: 'A4', page_layout: :portrait, **options
    end

    def render
      text @data[:msg]
      super
    end
  end
end
