class Popolo::MotionsController < API::MotionsController

  API::Documentation::Popolo.document!

  private

  def resource_serializer
    Popolo::MotionSerializer
  end

  def serializer_root
    :motions
  end

end
