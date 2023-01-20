class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter
end
