class API::Documentation::Popolo < API::Documentation::Base

  def self.resources
    %w(motions).freeze
  end

  def motions_api
    define_resource Popolo::MotionsController do
      document_rest_actions :popolo, only: [:index], version: :popolo
    end
  end
end
