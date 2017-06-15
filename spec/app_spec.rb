require_relative 'spec_helper.rb'

RSpec.describe 'Testing sinatra application' do

  it 'should greet' do
    get '/'
    expect(last_response).to be_ok
  end

end
