feature 'Text Management' do

  before { admin_sign_in }

  context 'Receiving texts from volunteers' do
    scenario 'Should list all received texts' do
      VCR.use_cassette "receive texts" do
        vol = add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447791234567', nil)
        build_text(vol, 'Yes I can help today')
        visit texts_path
        expect(page).to have_content 'Josh'
        expect(page).to have_content 'Yes I can help today'
      end
    end
  end

  context 'Sending texts to volunteers' do
    xscenario 'Should be able to send a text to all volunteers' do
      VCR.use_cassette "send texts" do
        add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447450267998', nil)
        visit pages_path
        fill_in 'custom_body', with: "It's awful weather! Are you available to help today? Snow Angels"
        click_button 'Send text'
        expect(page).to have_content "Angels have been notified"
        expect(current_path).to eq '/pages'
      end
    end

    xscenario 'Should be able to send a text to a match volunteer' do
      VCR.use_cassette "send an individual text" do
        add_volunteer('Josh', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447450267998', true)
        add_volunteer('Steph', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447450267997', true)
        add_volunteer('Bibiana', 'Test', 'one@test.com', 'XYZ', 'EC1 2DR', '+447450267996', true)
        add_client('Richard', 'test', '1 Test road', 'EC1 2DR', '+447450267995')
        click_link 'View client'
        click_on 'icon_add_task'
        select 'Shopping', from: 'Task type'
        click_button 'Create Task'
        within '#Josh' do
          fill_in 'custom_body', with: 'Mr. Test, 1 Test road, needs his shopping done, are you available?'
          click_button 'Send text'
        end
        expect(page).to have_content "Text sent"
        expect(current_path).to eq '/pages'
      end
    end
  end

end