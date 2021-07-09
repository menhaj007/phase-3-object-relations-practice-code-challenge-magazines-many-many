class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions
  
  def subscriptions
    Subscription.all.select { |subscription| subscription.magazine == self }
  end
  def readers
    subscriptions.map { |sub| sub.magazine }
  end
  
end