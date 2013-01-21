def sign_in
  FactoryGirl.create(:user)
  visit root_path
  click_link "Sign in"
  fill_in "user_email", with: "admin@example.com"
  fill_in "user_password", with: "abcd1234"
  click_button "Sign in"
end
