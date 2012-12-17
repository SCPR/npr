##
# NPR::Entity::Image
#
module NPR
  module Entity
    class Image < Base
      attr_accessor :id, :type, :width, :src, :hasBorder, :link
      shallow_attribute "title", "caption", "producer", "copyright"
      has_many "crops", :key => "crop", :class_name => NPR::Entity::Crop
      has_one "enlargement", :class_name => NPR::Entity::Enlargement
      has_one "provider", :class_name => NPR::Entity::Provider
      
      #-------------
      # NOTE that the "link" attribute here is not cast into a Link
      # object, and the "url" parameter is ignored. Instead, just 
      # calling +image.link+ will return the URL parameter.
      def initialize(json)
        @id        = json["id"].to_i
        @type      = json["type"]
        @width     = json["width"].to_i
        @src       = json["src"]
        @hasBorder = json["hasBorder"] == "true"
        
        if json["link"]
          @link = json["link"]["url"]
        end
        
        extract_shallow_attributes(json)
        create_relations(json)
      end
      
      #--------------------
      
      def primary?
        self.type == "primary"
      end
      
      #--------------------
      
      def standard?
        self.type == "standard"
      end
    end # Image
  end # Entity
end # NPR
