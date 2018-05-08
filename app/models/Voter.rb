# This class contains the relationship that voters have with bills
class Voter < ActiveRecord::Base
  has_many    :bills,      through: :SubscriptioniList
end
