describe "Articles" do

  it "Creates a new article", :js => true do
    @user_attr = FactoryGirl.attributes_for(:user)
    user = User.create!(@user_attr)

    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "secret"
    click_button "Sign in"

    visit root_path
    expect{
      fill_in "Title", with: "A super test title"
      fill_in "Body", with: "move your body"
      click_button "Create Article"
    }.to change(Article, :count).by(1)
    current_path.should eq articles_path
    page.should have_content("Article was successfully created")
    #save_and_open_page
  end
end
