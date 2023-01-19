class MicropostsController < ApplicationController
  # GET /microposts
  # GET /microposts.xml
  def index
    @microposts = Micropost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @microposts }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.xml
  def show
    @micropost = Micropost.where("id = ?", params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render xml: @micropost }
    end
  end

  # GET /microposts/new
  # GET /microposts/new.xml
  def new
    @micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.where("id = ?", params[:id]).first
  end

  # POST /microposts
  # POST /microposts.xml
  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html {
          redirect_to(@micropost,
            notice: "Micropost was successfully created.")
        }
        format.xml {
          render xml: @micropost,
            status: :created, location: @micropost
        }
      else
        format.html { render action: "new" }
        format.xml {
          render xml: @micropost.errors,
            status: :unprocessable_entity
        }
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.xml
  def update
    @micropost = Micropost.where("id = ?", params[:id]).first

    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html {
          redirect_to(@micropost,
            notice: "Micropost was successfully updated.")
        }
        format.xml { head :ok }
      else
        format.html { render action: "edit" }
        format.xml {
          render xml: @micropost.errors,
            status: :unprocessable_entity
        }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.xml
  def destroy
    @micropost = Micropost.where("id = ?", params[:id]).first
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to(microposts_url) }
      format.xml { head :ok }
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:micropost)
  end
end
