# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include JsonResponder
  include Pagination
  protect_from_forgery unless: -> { request.format.json? }
end
