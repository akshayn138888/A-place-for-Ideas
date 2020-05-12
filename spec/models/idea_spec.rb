require 'rails_helper'

RSpec.describe Idea, type: :model do
  def current_user 
    @current_user ||= FactoryBot.create(:user)
  end
  describe "title" do
    it "is required" do	      
     
      idea = FactoryBot.build(:idea, title: nil)
      idea.valid?
      expect(idea.errors.messages).to(have_key(:title))	       

    end
    it "requires a unique title" do
      persisted_idea = FactoryBot.create(:idea)
     idea = FactoryBot.build(:idea, title: persisted_idea.title)
      
     idea.valid?
      expect(idea.errors.messages).to(have_key(:title))
    end	 
    it "requires a description" do
      idea = FactoryBot.build(:idea, description: nil)

      idea.valid?

      expect(idea.errors.messages).to(have_key(:description))
    end
  end
end  

