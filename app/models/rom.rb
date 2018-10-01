class Rom < ApplicationRecord
  belongs_to :user
  has_many :compartilhados
  has_many_attached :documentos
  has_many :usuarios

  scope :with_eager_loaded_documentos, -> { eager_load(documentos_attachments: :blob) }
  accepts_nested_attributes_for :compartilhados, :usuarios, reject_if: :all_blank, allow_destroy: true

  def delete_documento_attachment
    @documento = ActiveStorage::Attachment.find(params[:id])
    @documento.purge
    redirect_to @current_page
  end

  def user_nome
    	if self.sala.blank?
      		"Sem Cadastro"
    	else
      		self.sala.user.nome
    	end
    end

end
