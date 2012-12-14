##
# NPR::Concern::Relation
#
module NPR
  module Concern
    module Relation
      def self.included(base)
        base.extend ClassMethods
      end

      #-----------------
      
      module ClassMethods
        #-----------------
        # Define a relationship
        # Similar to ActiveRecord's +has_many+
        #
        # Arguments: 
        #
        # * name (String) - the name of the relation
        # * options (Hash)
        #     * class_name (Class) - the class for the related objects
        #     * key (String) - the JSON key that holds this relation
        #
        # Example:
        #
        #   has_many "links", key: "link", class_name: NPR::Entity::Link
        #
        def has_many(name, options)
          class_name = options[:class_name]
          key        = options[:key]
      
          relation = { 
            :name       => name, 
            :class_name => class_name,
            :key        => key
          }
      
          # Define getter and setter for this attribute
          # Forces the relation into an empty array when
          # it's first accessed.
          attr_writer name
          define_method name do
            instance_variable_get("@#{name}") || instance_variable_set("@#{name}", [])
          end
      
          _relations.push relation
        end

        #-----------------
      
        def _relations
          @relations ||= []
        end

        #-----------------
    
        private
        attr_writer :_relations
      end


      #-----------------

      private
      
      #-----------------
      # Populate the relations based on 
      def create_relations(json)
        self.class._relations.each do |relation|
          collection = []
        
          if node = json[relation[:key]]
            node.each do |obj| 
              collection.push relation[:class_name].new(obj)
            end
          end
        
          send "#{relation[:name]}=", collection
        end
      end
    end # Relation
  end # Concern
end # NPR
