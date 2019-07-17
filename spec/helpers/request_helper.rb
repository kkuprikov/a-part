# frozen_string_literal: true

module RequestHelper
  shared_context 'External API stubs' do
    before do
      stub_request(:get, 'https://raw.githubusercontent.com/kirillplatonov/apartments-feed-test/master/apartments.yml')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: file_fixture('apartments.yml'), headers: {})

      stub_request(:get, 'https://raw.githubusercontent.com/kirillplatonov/apartments-feed-test/master/rental_agencies.yml')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: file_fixture('rental_agencies.yml'), headers: {})
    end
  end
end
