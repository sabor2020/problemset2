xml.instruct!
xml.quotations do
  @quotations.each do |quotation|
    xml.quotation do
      xml.quote quotation.quote
      xml.author_name quotation.author_name
      xml.category quotation.category
    end
  end
end