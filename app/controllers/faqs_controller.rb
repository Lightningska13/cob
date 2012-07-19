class FaqsController < ApplicationController
	# collection_select bombs if validations run unless we define 
	# @departments here. Doesn't work in New and Edit when validations run
	# put it here instead of in the view (where it works also with validations)
	# This is the same as including the @departments in each of the listed actions
  before_filter :instantiate_departments, :only => [:index, :new, :edit, :create, :update]
	before_filter :check_auth, :only=>[:edit]
  
  def instantiate_departments
  	@departments = Department.find(:all, :order => 'dept_name asc')
  	@faq_categories=FaqCategory.order(:category)
  	@page_title = "#{@current_action.titleize} FAQs"
  end
  
  def sort
  	params[:faq].each_with_index do |id, index|
  		Faq.update_all(['position=?', index+1], ['id=?', id])
  	end
  	render :nothing=>true
  end
 
  #for listing faq categories on the show and index pages
  def get_dept_cat
    @faqs = Faq.find(:all, :include=> :department, :order => 'departments.id ASC, faqs.position ASC')
    @faq_dept = @faqs.group_by { |c| c.department }
    
  end
  
  # GET /faqs
  # GET /faqs.xml
  def index
    get_dept_cat
   	@page_title = "FAQs"
  	if params[:dept] and (params[:dept]) != ""
  		@dept = Department.find(params[:dept])
	    @faqs = @dept.faqs.order(:position)
	    @title_text= @dept.dept_name
  	  @blurb= (@faqs.size == 1 ? "There is 1 result." : "There are #{@faqs.size} results.")
 	    @page_title= @page_title + @title_text 
 	  elsif params[:cat]
    		@cat = FaqCategory.find(params[:cat])
  	    @faqs = @cat.faqs
  	    @title_text= @cat.category
   	    @page_title= @page_title + @title_text
 		elsif params[:search] and (params[:search] != "")
	  	@faqs = Faq.search(params[:search])
	    @title_text='Search Results'
  	  @blurb= (@faqs.size == 1 ? "There is 1 result." : "There are #{@faqs.size} results.")
 		else 
	  	@faqs = Faq.order(:position)
	    @title_text='All FAQs'
  	  @blurb= ''
    end
    if admin?
    	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.xml
  def show
    @faq = Faq.find(params[:id])
    get_dept_cat
  	@page_title = @faq.question

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @faq }
    end
  end

  # GET /faqs/new
  # GET /faqs/new.xml
  def new
    @faq = Faq.new
    @button_text = 'Create'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
    @button_text = 'Update'
 end

  # POST /faqs
  # POST /faqs.xml
  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        flash[:notice] = 'Faq was successfully created.'
        format.html { redirect_to(@faq) }
        format.xml  { render :xml => @faq, :status => :created, :location => @faq }
      else
		    @button_text = 'Create'
        format.html { render :action => "new" }
        format.xml  { render :xml => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.xml
  def update
  	params[:faq][:faq_category_ids] ||= []
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        flash[:notice] = 'Faq was successfully updated.'
        format.html { redirect_to(@faq) }
        format.xml  { head :ok }
      else
		    @button_text = 'Update'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.xml
  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to(faqs_url) }
      format.xml  { head :ok }
    end
  end
end
