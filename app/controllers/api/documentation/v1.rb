class API::Documentation::V1 < API::Documentation::Base

  def self.resources
    %w(users memberships membership_requests invitations groups
       discussions events comments motions votes did_not_votes
       notifications).freeze
  end

  def users_api
    define_resource API::UsersController do
      document_rest_actions :v1, only: [:show]
    end
  end

  def memberships_api
    define_resource API::MembershipsController do
      document_rest_actions :v1, only: [:index, :create, :update, :destroy]
    end
  end

  def membership_requests_api
    define_resource API::MembershipRequestsController do
      document_rest_actions :v1, only: [:create]
    end
  end

  def invitations_api
    define_resource API::InvitationsController do
      document_rest_actions :v1, only: [:create, :destroy]
    end
  end

  def groups_api
    define_resource API::GroupsController do
      document_rest_actions :v1, only: [:show, :create, :update]
    end
  end

  def discussions_api
    define_resource API::DiscussionsController do
      document_rest_actions :v1, only: [:index, :show, :create, :update, :destroy]
    end
  end

  def events_api
    define_resource API::EventsController do
      document_rest_actions :v1, only: [:index]
    end
  end

  def comments_api
    define_resource API::CommentsController do
      document_rest_actions :v1, only: [:create, :update, :destroy]
      document_member_action :v1, :POST, :like, description: "Like a comment"
      document_member_action :v1, :POST, :unlike, description: "Unlike a comment"
    end
  end

  def attachments_api
    define_resource API::AttachmentsController do
      document_rest_actions :v1, only: [:create, :destroy]
    end
  end

  def motions_api
    define_resource API::MotionsController do
      document_rest_actions :v1, only: [:index, :show, :create, :update], path: :proposals
    end
  end

  def votes_api
    define_resource API::VotesController do
      document_rest_actions :v1, only: [:index, :create, :update]
    end
  end

  def did_not_votes_api
    define_resource API::DidNotVotesController do
      document_rest_actions :v1, only: [:index]
    end
  end

  def notifications_api
    define_resource API::NotificationsController do
      document_rest_actions :v1, only: [:index]
    end
  end

end
