require 'rails_helper'

RSpec.describe "Property", type: :request do

  feature "Visit properties page" do
    before { visit root_path }

    scenario("has status 200") { expect(page.status_code).to eq 200 }
    scenario("has a title") { expect(page).to have_selector 'h1#properties-list-title' }
    scenario("suggest creation of account") { expect(page).to have_content 'Create an account for free' }
  end

  feature "Visit sign in page" do
    before { visit new_user_session_path }

    scenario("has status 200") { expect(page.status_code).to eq 200 }
    scenario("has title") { expect(page).to have_content 'Welcome back' }
    scenario("has email input") { expect(page).to have_selector 'input#user_email' }
    scenario("has password input") { expect(page).to have_selector 'input#user_password' }
    scenario("has submit button") { expect(page).to have_selector 'button[type=submit]' }
    scenario("has facebook login") { expect(page).to have_selector 'a.oauth-facebook' }
  end
end
