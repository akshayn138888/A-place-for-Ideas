require "rails_helper"

RSpec.describe IdeasController, type: :controller do
    def current_user
        @current_user ||= User.create({name: 'Akshay Nanda', email: 'akshayn@sfu.ca', password: 'supersecret'})
    end
    describe "#new" do
    
    context "without a signed in user" do
      it "redirect them to the login page" do
        get :new
        expect(response).to(redirect_to(new_session_path))
      end
    end
    
    context "with a signed in user" do
        it "renders a page" do
          session[:user_id] = current_user.id
            get :new
            expect(response).to(render_template(:new))
        end
        it "creates a new @question instance" do
            session[:user_id] = current_user.id
            get(:new)
            expect(assigns(:idea)).to(be_a_new(Idea))
        end
        
       end
    
    end
    describe "#create" do

        context "user not signed in" do
          it "redirects to the sign in page" do
                get :create
                expect(response).to(redirect_to(new_session_path))
           end
        end
        context "user is signed in" do
            context "with invalid data" do
              it "does not insert a new record in the database" do
                session[:user_id] = current_user.id
                before_count = Idea.count
                post(:create, params: { idea: {title: '', description:'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij'} })
                after_count = Idea.count
                expect(after_count).to(eq(before_count))
              end
            end
        end
        
    end
    
end

