class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.valid?                                                                                                                                                                   
      ContactMailer.contact_email(@contact_form).deliver
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => @contact_form.errors, :status => :unprocessable_entity }
      end
    end
  end
end
