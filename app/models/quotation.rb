class Quotation < ApplicationRecord
  attr_accessor :old_cat

  before_save do
    if self.old_cat.present?
      self.category = self.old_cat
    end
  end

end
