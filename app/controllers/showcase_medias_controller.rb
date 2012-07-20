class ShowcaseMediasController < ApplicationController
  # GET /showcase_medias
  # GET /showcase_medias.xml
  def index
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_medias = @showcase.showcase_medias

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @showcase_medias }
    end
  end

  # GET /showcase_medias/1
  # GET /showcase_medias/1.xml
  def show
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_media = @showcase.showcase_medias.find(params[:id])
 

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @showcase_media }
    end
  end

  # GET /showcase_medias/new
  # GET /showcase_medias/new.xml
  def new
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_media = @showcase.showcase_medias.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @showcase_media }
    end
  end

  # GET /showcase_medias/1/edit
  def edit
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_media = @showcase.showcase_medias.find(params[:id])
  end

  # POST /showcase_medias
  # POST /showcase_medias.xml
  def create
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_media = @showcase.showcase_medias.build(params[:showcase_media])

    if @showcase_media.save
      redirect_to edit_showcase_url(@showcase)
    else
      render :action => "new"
    end
  end

  # PUT /showcase_medias/1
  # PUT /showcase_medias/1.xml
  def update
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_media = ShowcaseMedia.find(params[:id])

    if @showcase_media.update_attributes(params[:showcase_media])
      redirect_to edit_showcase_url(@showcase)
    else
      render :action => "edit"
    end
  end

  # DELETE /showcase_medias/1
  # DELETE /showcase_medias/1.xml
  def destroy
    @showcase = Showcase.find(params[:showcase_id])
    @showcase_media = ShowcaseMedia.find(params[:id])
    @showcase_media.destroy

    respond_to do |format|
      format.html { redirect_to edit_showcase_path(@showcase) }
      format.xml  { head :ok }
    end
  end
end
