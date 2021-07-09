class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions
  
  def subscriptions
    Subscription.all.select { |subscription| subscription.reader == self }
  end
  def magazines
    # Magazine.all.select { |magazine| magazine.reader == self }
    subscriptions.map { |sub| sub.magazine }
  end
  
  def subscribe(magazine, price)
    # Magazine.create(magazine)
    Subscription.create(reader_id: self.id, magazine_id: magazine.id, price: price)
  end
  def total_subscription_price
    prices = self.subscriptions.map { | sub| sub.price }.sum
  end
  def cancel_subscription(magazine)
    found_sub = self.sub.find_by(magaine_id: magazine.id)
    found_sub.destroy
  end
end