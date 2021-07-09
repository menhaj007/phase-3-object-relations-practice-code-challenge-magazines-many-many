class Subscription < ActiveRecord::Base
  belongs_to :reader
  belongs_to :magazine
  
#   def reader
#     Reader.all.select { |reader| reader.subscription == self}
#   end
#
#   def magazine
#     Magazine.all.select { |magazine| magazine.subscription == self}
#   end
    def print_details
      puts "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"
    end
  
  
end