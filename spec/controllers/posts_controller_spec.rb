require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post) { create(:post) }

  describe 'GET #index' do
    let(:posts) { create_list(:post, 2) }

    before { get :index }

    #it 'populates an array of all posts' do
    #  expect(assigns(:posts)).to match_array(posts)
    #end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: post.id } }

    it 'assigns the requested question to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end