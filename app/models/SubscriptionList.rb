# This describes the relationship between bills and voters
class SubscriptionList < ActiveRecord::Base
    has_many      :voters
    has_many      :bills
end
