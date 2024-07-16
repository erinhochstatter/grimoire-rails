require 'rails_helper'

RSpec.describe '/post', type: :request do
  let(:friend) { FactoryBot.create(:friend) }
  let(:valid_attributes) { attributes_for(:post, friend_id: friend.id) }
  let(:invalid_attributes) do
    {
      author: Faker::Book.author,
      kind: 'game',
      datePublished: 5.years.ago,
      friend:
    }
  end

  describe 'GET /index' do
    describe 'without params' do
      it 'renders a successful response' do
        Post.create! valid_attributes
        get posts_url
        expect(response).to be_successful
      end
    end

    describe 'with params' do
      let!(:book_post) { create(:post, kind: 'book') }
      let!(:article_post) { create(:post, kind: 'article') }
      let(:json_response) { JSON.parse(response.body) }

      it 'it returns only the kind of post in the param, when there is a query param' do
        get posts_url, params: { kind: 'article' }
        expect(json_response).to eq({ 'posts' => [article_post.as_json] })
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Post.create! valid_attributes
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect do
          post posts_url, params: { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Post' do
        expect do
          post posts_url, params: { post: invalid_attributes }
        end.to change(Post, :count).by(0)
      end

      it 'renders a response with 422 status' do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested post' do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: new_attributes }
        post.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the post' do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      post = Post.create! valid_attributes
      expect do
        delete post_url(post)
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts post' do
      post = Post.create! valid_attributes
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
