class CertificateContainer < ApplicationRecord
  belongs_to :certificate
  belongs_to :container
end
