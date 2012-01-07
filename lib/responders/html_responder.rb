# lib/app_responder.rb
require Rails.root.join('lib/responders/flash_responder')

class HtmlResponder < ActionController::Responder
  include Responders::FlashResponder
end
