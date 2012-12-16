require "spec_helper"

describe NPR::Entity::Permissions do
  describe "with all permissions sent" do
    json_fixture do
      <<-JSON
        {
          "download": {
            "allow": "true"
          },
          "stream": {
            "allow": "true"
          },
          "embed": {
            "allow": "true"
          }
        }
      JSON
    end
  
    before :each do
      @permissions = NPR::Entity::Permissions.new(@fixture)
    end
  
    it "sets the permissions" do
      @permissions.download.should eq true
      @permissions.stream.should eq true
      @permissions.embed.should eq true
    end
  end
  
  #-------------------
  
  describe "something is missing" do
    json_fixture do
      <<-JSON
        {
          "download": {
            "allow": "true"
          },
          "stream": {
            "allow": "true"
          }
        }
      JSON
    end
  
    before :each do
      @permissions = NPR::Entity::Permissions.new(@fixture)
    end
  
    it "sets the permissions" do
      @permissions.embed.should eq nil
    end
  end
end
