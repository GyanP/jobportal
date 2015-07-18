class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json

  class MissingParameter < StandardError
  end

  rescue_from MissingParameter do |exception|
    render json: {:success => false, :message => "#{@param_name} is required!"}, status: 500
  end


  def handle_exception(message)
    render json: {:success => false, :message => message}, status: 500
  end


  def prepare!(required_params)
    required_params.each do |param_name|
      if params[param_name].blank?
        @param_name = param_name
        raise MissingParameter
      end
    end
  end

end
