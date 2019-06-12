# Files in spec/api should test the api files located in app/api. The described class must be the API class constant
# in order to be recognized by Rack::Test.
#
# Example:
#
#  describe API::Foos do
#    context 'POST /foo' do
#      it 'should respond with bar' do
#        post '/api/foo'
#        expect(last_response.status).to eql 200
#        expect(json[:foo]).to eql 'bar'
#      end
#    end
#  end

describe API::Example do
  context 'GET /' do
    let(:who) { 'world' }

    before do
      get '/api/example', who: who
    end

    it 'should respond with 200' do
      expect_status 200
      expect(json[:hello]).to eql who
    end
  end

  context 'GET / with param' do
    before do
      get '/api/example', who: 'me'
    end

    it 'should respond with 200' do
      expect_status 200
      expect(json[:hello]).to eql 'me'
    end
  end
end
