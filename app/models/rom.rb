class Rom < ApplicationRecord
  belongs_to :user
  has_many_attached :documentos

  scope :with_eager_loaded_documentos, -> { eager_load(documentos_attachments: :blob) }
  #accepts_nested_attributes_for :documentos, reject_if: :all_blank, allow_destroy: true

  def delete_documento_attachment
    @documento = ActiveStorage::Attachment.find(params[:id])
    @documento.purge
    redirect_to @current_page
  end

end
