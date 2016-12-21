class Order < ApplicationRecord
  belongs_to :client
  has_many :certificates
  # has_many :phytosanitary
  # has_many :bill_of_lading

  #Options for field selection
  MODES = ['Ocean / Maritimo','Land','Air', 'Export', 'Import', 'Other']
  STATUSES = ['Open','Closed','Void']

  validates :client, presence: true

  def order_for_select
    "#{id} - #{client.company} - #{status}"
  end
end
