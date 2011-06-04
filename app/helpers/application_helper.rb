module ApplicationHelper
  
  def link_to_add_quote_line(link, f)
    new_quote_line = QuoteLine.new
    quote_line_fields = f.fields_for(:quote_lines_attributes, new_quote_line, :child_index => "new_quote_line") do |builder|
      render("quote_line_fields", :f => builder, :remove => true)
    end
    link_to_function(link, "add_quote_line(this, \"#{escape_javascript(quote_line_fields)}\")")
  end
  
end
