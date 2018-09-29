class Usuario < ApplicationRecord
  belongs_to :user
  belongs_to :compartilhado

  accepts_nested_attributes_for :user, :compartilhado


	def user_nome
    	if self.compartilhado.user.blank?
      		"Sem Cadastro"
    	else
      	   self.compartilhado.user.nome
    	end
    end

end
