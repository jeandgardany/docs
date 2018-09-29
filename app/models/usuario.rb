class Usuario < ApplicationRecord
  belongs_to :user
  belongs_to :compartilhado

  accepts_nested_attributes_for :user, :compartilhado

end
