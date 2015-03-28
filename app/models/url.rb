class Url < ActiveRecord::Base
  after_create :post_create

  validates :short, uniqueness: true
  private

  def post_create
    set_zero
    shorten = generate_short
    if Url.find_by(short: shorten).nil?
      self.update_attributes(short: shorten)
    else
      self.update_attributes(short: generate_short)
    end
  end

  def set_zero
    self.count = 0
    self.save
  end

  def generate_short
    SecureRandom.hex(3)
  end
end
