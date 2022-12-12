class TicketsController < ApplicationController


  def index
    @tickets = Ticket.all
    render 'tickets'
  end
  
  def create
    # Create a new ticket using the submitted data
    ticket = Ticket.new(params[:ticket])

    # Save the ticket to the database
    if ticket.save
      # If the ticket is successfully saved, redirect the user to the ticket page
      redirect_to ticket_path(ticket)
    else
      # If the ticket is not successfully saved, display an error message
      flash[:error] = "There was a problem creating your ticket"
    end
  end

  def show
    # Retrieve the specified ticket from the database
    @ticket = Ticket.find(params[:id])
  end
end
