class ChargesController < ApplicationController
  require 'stripe'
  def index
    
  end

  def show
  end

  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user }",
     amount: 500
    }
  end

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: params[:stripeEmail],
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 500,
     description: "Premium Membership", # #{current_user.email}
     currency: 'usd'
   )
   
   current_user.update_attribute(:role, 'premium') # updates the user role attribute according to the downgrade button
 
   flash[:notice] = "The payment made by #{current_user.email} was a success. Thank you!"
   redirect_to wikis_path # or wherever
 
   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
  end
  
  def downgrade
    flash[:notice] = "You have successfully downgraded your plan to standard. Remember that all wikis are now public."
    current_user.update_attribute(:role, 'standard')
    current_user.wikis.update_all(:private => nil)
    redirect_to wikis_path
  end
  def edit
  end
end
