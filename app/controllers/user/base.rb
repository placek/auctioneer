#encoding: utf-8
require Rails.root.join('lib/responders/html_responder')

class User::Base < ApplicationController
  self.responder = HtmlResponder
  respond_to :html
  before_filter :authenticate_user!

  protected

  def respond_with(*args)
    super(:user, *args)
  end
end
