class Pokemon < ApplicationRecord

  validates_presence_of :name, :poke_id
  validates_uniqueness_of :poke_id
  
end
