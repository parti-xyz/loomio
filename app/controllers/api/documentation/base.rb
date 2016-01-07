class API::Documentation::Base

  def self.document!
    new.document!(resources)
  end
  
  def self.resources
    raise NotImplementedError.new
  end

  def document!(resources)
    return unless Apipie.active_dsl?
    resources.each { |resource| send(:"#{resource}_api") }
  end

  private

  def define_resource(controller, &block)
    return unless block_given?
    spec = API::Documentation::Dsl.eval_dsl(controller, &block)
  end

end
