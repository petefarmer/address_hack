class Company < ApplicationRecord
  has_one :billing_address, -> { where(address_type: 'billing') }, 
    class_name: 'Address', as: :addressable, dependent: :destroy
  has_one :shipping_address, -> { where(address_type: 'shipping') }, 
    class_name: 'Address', as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :billing_address, :shipping_address

  validates :name, presence: true
  validates :email, presence: true, 
                   format: { 
                     with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/,
                     message: "must be a valid email address (e.g., user@example.com)"
                   }
  validates :phone, presence: true
  validates :contact_person, presence: true

  before_validation :set_address_types
  before_validation :normalize_email

  private

  def set_address_types
    billing_address.address_type = 'billing' if billing_address
    shipping_address.address_type = 'shipping' if shipping_address
  end

  def normalize_email
    self.email = email.to_s.downcase.strip
  end
end
