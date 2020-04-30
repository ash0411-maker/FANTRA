module ControllerMacros

  def login_admin(admin)
    Rails.logger.debug "UETANI #{admin.email}"
    controller.stub(:authenticate_admin!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_guide(guide)
    Rails.logger.debug "UETANI_guide #{guide}"
    controller.stub(:authenticate_guide!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:guide]
    sign_in guide
  end

  def login_tourist(tourist)
    controller.stub(:authenticate_tourist!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:tourist]
    sign_in tourist
  end

end