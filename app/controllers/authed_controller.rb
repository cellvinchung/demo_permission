class AuthedController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_authorize

  private

  def setup_authorize
    authorize self.class.name.demodulize.to_s.gsub('Controller', '').singularize.constantize
  end
end
