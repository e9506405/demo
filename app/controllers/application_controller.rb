class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_current_url
    before_action :require_login

    private

    def set_current_url
        session[:current_url] = request.url
    end
end
