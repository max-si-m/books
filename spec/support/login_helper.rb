module LoginHelper
  def login(user, scope: :user)
    fill_in "#{scope}_email", with: user.email
    fill_in "#{scope}_password", with: user.password
    click_on 'Log in'
  end
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end
