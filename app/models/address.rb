class Address < ApplicationRecord
  COUNTRY_CODES = {
    'US' => 'United States',
    'CA' => 'Canada',
    'GB' => 'United Kingdom',
    'DE' => 'Germany',
    'FR' => 'France',
    'IT' => 'Italy',
    'ES' => 'Spain',
    'CH' => 'Switzerland',
    'AT' => 'Austria',
    'BE' => 'Belgium',
    'NL' => 'Netherlands',
    'SE' => 'Sweden',
    'NO' => 'Norway',
    'DK' => 'Denmark',
    'FI' => 'Finland',
    'IE' => 'Ireland',
    'PT' => 'Portugal',
    'GR' => 'Greece',
    'JP' => 'Japan',
    'CN' => 'China',
    'AU' => 'Australia',
    'NZ' => 'New Zealand',
    'BR' => 'Brazil',
    'IN' => 'India',
    'RU' => 'Russia'
  }.freeze

  belongs_to :addressable, polymorphic: true

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true, inclusion: { in: COUNTRY_CODES.keys, message: "is not a valid country code" }
  validates :address_type, presence: true, inclusion: { in: %w[billing shipping] }

  def self.country_options
    COUNTRY_CODES.map { |code, name| [name, code] }.sort_by(&:first)
  end
end
