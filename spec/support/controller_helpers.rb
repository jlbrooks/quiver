module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      request.env['warden'].stub(:authenticate!).
        and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user) { nil }
    else
      request.env['warden'].stub :authenticate! => user
      allow(controller).to receive(:current_user) { user }
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerHelpers, :type => :controller
end

#call 'sign_in(user)' to sign in a user
#call 'sign_in(nil)' to have no user signed in