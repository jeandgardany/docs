module UsuariosHelper
	def user_nome
    	if self.compartilhado.blank?
      		"Sem Cadastro"
    	else
      	   self.compartilhado.user.nome
    	end
    end
end
