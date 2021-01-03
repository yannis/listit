require 'rails_helper'

RSpec.describe "Crosses", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/cross/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/cross/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
