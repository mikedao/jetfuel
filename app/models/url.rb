class Url < ActiveRecord::Base
  after_create :post_create

  validates :short, uniqueness: true
  private

  def post_create
    set_zero
    shorten = generate_short
    if Url.find_by(short: shorten).nil?
      update_attributes(short: shorten)
    else
      update_attributes(short: generate_short)
    end
  end

  def set_zero
    self.count = 0
    save
  end

  def generate_short
    SecureRandom.hex(3)
  end
end
