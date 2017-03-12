module Response
  def json_response(object, status = :ok)
    #render json: object, status: status
    #render json: Array(object), status: status, root: resource_name.pluralize
    render json: object, status: status, adapter: :json_api
  end
end
