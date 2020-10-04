##
# Json responder provide methods to controller for json rendering
##
module JsonResponder
  def json_response(data, status: :ok)
    render json: data, status: status
  end

  def json_error_response(errors, status: :unprocessable_entity)
    json_response({ error: true, messages: errors }, status: status)
  end
end