class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_resource, only: [:show, :update, :destroy]

  def index
    resources = resource_class.all
    filtered_params.each do |k, v|
      resources = resources.public_send(k, v) if v.present?
    end
    json_response resources
  end

  def create
    resource = resource_class.create!(resource_params)
    json_response resource, :created
  end

  def show
    json_response get_resource
  end

  def update
    resource = get_resource
    resource.update!(resource_params)
    json_response resource, :ok
  end

  def destroy
    get_resource.destroy
    head :no_content
  end

  private

  def set_resource
    resource = resource_class.find(params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

  def get_resource
    instance_variable_get("@#{resource_name}")
  end

  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def resource_params
    self.send("#{resource_name}_params")
  end

  def filter_params
    []
  end

  def filtered_params
    params.slice(*filter_params)
  end
end
