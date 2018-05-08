# This class decribes the bill's various relationships with other sets.
class Bill < ActiveRecord::Base
  has_many    :voters,      through: :SubscriptionList
end
