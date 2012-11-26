describe "Articles" do

  it "Creates a new article", :js => true do
    @user_attr = FactoryGirl.attributes_for(:admin)
    admin = User.create!(@user_attr)

    @user_attr = FactoryGirl.attributes_for(:notapproved)
    new_user = User.create!(@user_attr)

    visit root_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: "secret"
    click_button "Sign in"

    click_link "Admin"
    find_by_id("approve_#{new_user.id}").click
    find_by_id("block_#{new_user.id}").should have_content("Block")
   end
end
