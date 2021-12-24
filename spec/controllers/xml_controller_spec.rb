require 'rails_helper'

describe XmlController, type: :controller do
  def get_xml(number)
    get :index, params: { number: input_number, format: :xml }
    response
  end

  it 'should respond with RSS' do
    get :index, params: { number: 174, format: :rss }
    expect(response.content_type).to include('xml')
  end

end
