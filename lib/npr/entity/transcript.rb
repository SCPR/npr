##
# NPR::Entity::Transcript
#
module NPR
  module Entity
    class Transcript < Base
      has_one "link", :class_name => NPR::Entity::Link

      #-------------------

      def initialize(json)
        create_relations(json)
      end
    end # Transcript
  end # Entity
end # NPR
