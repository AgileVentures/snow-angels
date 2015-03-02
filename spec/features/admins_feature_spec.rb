feature 'Admins' do
  context "A logged out admin on the homepage" do

    before { visit '/' }

    scenario "Can sign in" do
      expect(page).to have_link 'Sign in'
    end

    scenario "Cannot sign out" do
      expect(page).not_to have_link 'Sign out'
    end

  end

  context "A signed in admin on the homepage" do

    before do 
      admin_sign_in
    end

    scenario "Can sign out" do
      expect(page).to have_link 'Sign out'
    end

    scenario "Cannot sign in" do
      expect(page).not_to have_link 'Sign in'
    end

  end


end