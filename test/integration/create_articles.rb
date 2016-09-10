require "test_helper"

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "johndoe", email: "johndoe@example.com", password: "password")
  end

  test "get new article form and create article" do
    sign_in_as(@user, 'password')
    article_params = {
      title: "Title of the article",
      description: "This is the description of the articles"
    }

    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: article_params
    end
    assert_template 'articles/show'
    assert_match article_params[:title], response.body
    assert_match article_params[:description], response.body
  end

  test "invalid article submission results in failure" do
    sign_in_as(@user, 'password')
    article_params = {
      title: " ",
      description: " "
    }

    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
      post articles_path, article: article_params
    end
    assert_template 'articles/new'
    assert_select "div.messages--errors"
    assert_select "li.messages__item"
  end

end