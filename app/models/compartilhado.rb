class Compartilhado < ApplicationRecord

has_many_attached :arquivos
has_many :roms
has_many :usuarios
belongs_to :user
has_many :users, through: :usuarios

accepts_nested_attributes_for :user, :roms, reject_if: :all_blank, allow_destroy: true
accepts_nested_attributes_for :usuarios, reject_if: proc { |attributes| attributes[:user_id].blank? }, allow_destroy: true
accepts_nested_attributes_for :users

end
