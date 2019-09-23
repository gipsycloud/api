class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  # check_authorization unless: :do_not_check_authorization?

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  protected

  def do_not_check_authorization?
    respond_to?(:devise_controller?) # or
  end
end
