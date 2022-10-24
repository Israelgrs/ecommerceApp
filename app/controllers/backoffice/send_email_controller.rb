class Backoffice::SendEmailController < ApplicationController
  def edit
    respond_to do |format|
      format.js
    end
  end
  def create;end
end
