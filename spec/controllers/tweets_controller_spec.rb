require 'rails_helper'

describe TweetsController, type: :controller do

  describe 'GET #new' do
    it "new.html.erbに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@tweetに正しい値が入っていること" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    it "edit.html.erbに遷移すること" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do

    it "index.html.erbに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end