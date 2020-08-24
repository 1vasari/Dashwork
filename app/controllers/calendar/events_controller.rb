module Calendar
  class EventsController < ApplicationController
    before_action :set_calendar_event, only: [:show, :edit, :update, :destroy]

    # GET /calendar_events
    # GET /calendar_events.json
    def index
      @calendar_events = current_tenant.calendar_events.all
    end

    # GET /calendar_events/1
    # GET /calendar_events/1.json
    def show
    end

    # GET /calendar_events/new
    def new
      @calendar_event = current_tenant.calendar_events.new
    end

    # GET /calendar_events/1/edit
    def edit
    end

    # POST /calendar_events
    # POST /calendar_events.json
    def create
      @calendar_event = current_tenant.calendar_events.new(calendar_event_params)
      @calendar_event.user = current_user

      respond_to do |format|
        if @calendar_event.save
          format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully created.' }
          format.json { render :show, status: :created, location: @calendar_event }
        else
          format.html { render :new }
          format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /calendar_events/1
    # PATCH/PUT /calendar_events/1.json
    def update
      respond_to do |format|
        if @calendar_event.update(calendar_event_params)
          format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully updated.' }
          format.json { render :show, status: :ok, location: @calendar_event }
        else
          format.html { render :edit }
          format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /calendar_events/1
    # DELETE /calendar_events/1.json
    def destroy
      @calendar_event.destroy
      respond_to do |format|
        format.html { redirect_to calendar_events_url, notice: 'Calendar event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_event
      @calendar_event = current_tenant.calendar_events.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calendar_event_params
      params.require(:calendar_event).permit(:name, :description, :start_at, :end_at)
    end
  end
end
