class Buy < ApplicationRecord
belongs_to :user
belongs_to :item
has_one    :delivery_location

end
