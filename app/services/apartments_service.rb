class ApartmentsService
  APARTMENTS_URL = 'https://raw.githubusercontent.com/kirillplatonov/apartments-feed-test/master/apartments.yml'
  AGENCIES_URL = 'https://raw.githubusercontent.com/kirillplatonov/apartments-feed-test/master/rental_agencies.yml'
  AGENCY_FIELDS = %w[price rental_agency]
  
  def self.load_feed
    @apartments = YAML.load(HTTParty.get(APARTMENTS_URL).body)
    @agencies = YAML.load(HTTParty.get(AGENCIES_URL).body)

    address_to_agency = {}

    @apartments.each do |apartment|
      data = address_to_agency[apartment.except(*AGENCY_FIELDS)]
      address_to_agency[apartment.except(*AGENCY_FIELDS)] = prioritize(apartment.slice(*AGENCY_FIELDS), data)
    end

    address_to_agency.map{|address, agency| address.merge(agency)}
  end

  private

  def self.prioritize new_offer, existing_offer
    return new_offer unless existing_offer

    new_offer_priority = @agencies[new_offer['rental_agency']].to_i
    existing_offer_priority = @agencies[existing_offer['rental_agency']].to_i

    new_offer_priority > existing_offer_priority ? new_offer : existing_offer
  end
end