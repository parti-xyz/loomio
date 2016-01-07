class API::Documentation::Dsl < Apipie::DSL::ResourceDescriptionDsl
  include Apipie::DSL::Action

  def document_rest_actions(prefix, only: [], except: [], path: nil, **options)
    resource_name = @controller.controller_name.singularize
    path ||= @controller.controller_name
    actions_from(only,except).each do |action|
      case action
      when :index
        api :GET, "/#{prefix}/#{path}", "Show a list of #{resource_name.pluralize}"
        api_version options[:version] || :v1
      when :show
        api :GET, "/#{prefix}/#{path}/:id", "Show a #{resource_name}"
      when :create
        api :POST, "/#{prefix}/#{path}/:id", "Create a #{resource_name}"
      when :update
        api :PUT, "/#{prefix}/#{path}/:id", "Update a #{resource_name}"
      when :destroy
        api :DELETE, "/#{prefix}/#{path}/:id", "Delete a #{resource_name}"
      end
      define_method_description(action)
    end
  end

  def document_member_action(prefix, action_type, action, options = {})
    api action_type, ['', prefix, options[:path] || default_path, ':id', action].join('/'), options[:description]
    define_method_description(action)
  end

  def document_collection_action(prefix, action_type, action, options = {})
    api action_type, ['', prefix, options[:path] || default_path, action].join('/'), options[:description]
    define_method_description(action)
  end

  private

  def default_path
    @controller.controller_name
  end

  def define_method_description(action)
    Apipie.define_method_description(@controller, action, _apipie_dsl_data)
    _apipie_dsl_data_clear
  end

  def actions_from(only, except)
    (only.presence || [:index, :show, :create, :update, :destroy]) - except
  end

end
