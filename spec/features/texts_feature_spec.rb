feature 'Text Management' do
  
  context 'Receiving texts from volunteers' do
    scenario 'Should list all received texts' do
      admin_sign_in
      vol = add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447791234567', nil)
      build_text(vol, 'Yes I can help today')
      visit texts_path
      expect(page).to have_content 'Josh'
      expect(page).to have_content 'Yes I can help today'
    end
  end

end