require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      post = FactoryGirl.create(:post)
      get :show, id: post
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

end
