require 'rails_helper'

RSpec.describe "Sharings", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sharings/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/sharings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/sharings/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
