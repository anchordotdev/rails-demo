class ApplicationController < ActionController::Base

  def api
    response = { name: Rails.root.basename.to_s, message: "Hello from rails-demo backend API" }

    render json: response.to_json
  end
end
