class Order < ApplicationRecord
  belongs_to :ad
  belongs_to :buyer, class_name: 'Member'

  enum status: %i[requested waiting analysing paid avaliable dispute returned canceled]
end
