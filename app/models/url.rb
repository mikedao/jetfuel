class Url < ActiveRecord::Base
  after_create :set_zero

  private

  def set_zero
    self.count = 0
  end
end
