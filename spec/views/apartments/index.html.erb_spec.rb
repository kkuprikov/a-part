# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'apartments/index.html.slim', type: :view do
  let(:apartments) { YAML.safe_load(file_fixture('result.yml').read) }

  it 'renders all apartments' do
    assign(:apartments, apartments)
    render

    expect(rendered).to include('<td>404 East 88th Street</td>')
  end
end
