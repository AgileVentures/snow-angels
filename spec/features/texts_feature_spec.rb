feature 'Text Management' do
  
  context 'Receiving texts from volunteers' do
    it 'Should list all received texts' do
      vol = build_volunteer
      build_text(vol, 'Yes I can help today')
      visit texts_path
      expect(page).to have_content 'Josh'
      expect(page).to have_content 'Yes I can help today'
    end
  end

  def build_volunteer
    Volunteer.create(name: 'Josh', mobile_number: '+447791234567', address: 'XYZ', availability: nil)
  end

  def build_text(volunteer, body)
    Text.create(number: '+447791234567', body: body, volunteer_id: volunteer.id)
  end

end