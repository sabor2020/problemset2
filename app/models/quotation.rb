class Quotation < ApplicationRecord
  attr_accessor :old_cate
  validates_presence_of :author_name
  validates_presence_of :quote
end
