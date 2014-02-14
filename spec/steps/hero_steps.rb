step 'I access the top page' do
  visit '/'
end

step 'it displays blog title' do
  expect(page).to have_content('pe::log')
end

step 'it displays blog subtitle' do
  expect(page).to have_content('A blog written by kadoppe')
end
