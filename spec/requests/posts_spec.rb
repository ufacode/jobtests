RSpec.describe 'Posts', type: :request do
  subject { response }

  describe 'GET /posts' do
    before { get posts_path }

    it { is_expected.to have_http_status(200) }
    it { is_expected.to render_template :index }
  end

  describe 'GET /posts/new' do
    before { get new_post_path }

    it { is_expected.to have_http_status(200) }
    it { is_expected.to render_template :new }
  end

  describe 'GET /posts/:id' do
    before do
      post = create(:post)
      get post_path(post)
    end

    it { is_expected.to have_http_status(200) }
    it { is_expected.to render_template :show }
  end

  describe 'DELETE /posts/:id' do
    before do
      post = create(:post)
      delete post_path(post)
    end

    it { is_expected.to have_http_status(302) }
    it { is_expected.to redirect_to posts_path }
  end
end
