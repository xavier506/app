class CertificateContainer < ApplicationRecord
  belongs_to :certificate
  belongs_to :container

  validates :container, uniqueness: true
end
