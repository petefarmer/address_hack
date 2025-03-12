class Item < ApplicationRecord
  # Validations
  validates :item_key, presence: true, uniqueness: true
  validates :upc_key, uniqueness: true, allow_blank: true
  validates :physical_count_days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :abc_key, inclusion: { in: %w[A B C], message: "must be A, B, or C" }, allow_blank: true
  validates :item_type, presence: true
  validates :order_method, inclusion: { in: %w[auto manual], message: "must be auto or manual" }, allow_blank: true
  
  # Callbacks
  before_save :normalize_keys
  
  private
  
  def normalize_keys
    self.item_key = self.item_key.strip.upcase if self.item_key.present?
    self.upc_key = self.upc_key.strip.upcase if self.upc_key.present?
    self.product_key = self.product_key.strip.upcase if self.product_key.present?
    self.commodity_key = self.commodity_key.strip.upcase if self.commodity_key.present?
    self.abc_key = self.abc_key.strip.upcase if self.abc_key.present?
    self.eccn_code = self.eccn_code.strip.upcase if self.eccn_code.present?
    self.manufacturer_code = self.manufacturer_code.strip.upcase if self.manufacturer_code.present?
  end
end
