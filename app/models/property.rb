class Property < ApplicationRecord
    validates :rentableId, uniqueness: true
end
