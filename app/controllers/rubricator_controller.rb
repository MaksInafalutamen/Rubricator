class RubricatorController < ApplicationController
  def index
    @rubrics = Rubric.all
    if Company.all.length > 2
      @lastadd = Company.all[-3..-1].reverse
    end
    @utype = user_type
  end

  def new
  	@rubrics = Rubric.all
    @srubrics = Subrubric.all
    @utype = user_type
  end

  def create_rubric
    if user_type == "admin"
    	@rubric = Rubric.new(params[:add_rubric])
    	@rubric.save
    end
    redirect_to :action => :new
  end

  def del_rubric
    if user_type == "admin"
      @rubric = Rubric.find_by_name(params[:r])
      @rubric.destroy
    end
    redirect_to :action => :index
  end

  def create_subrubric
    if user_type == "admin"
      @rubric = Rubric.find_by_name(params[:add_subrubric][:rubric_name])
      @subrubric = @rubric.subrubrics.create(:name => params[:add_subrubric][:name])
    end
    redirect_to :action => :new
  end

  def del_subrubric
    if user_type == "admin"
      @subrubric = Subrubric.find_by_name(params[:sr])
      @subrubric.destroy
    end
    redirect_to :action => :index
  end

  def create_company
    if user_type == "admin" || user_type == "user"
      @subrubric = Subrubric.find_by_name(params[:add_company][:subrubric_name])
      @company = @subrubric.companys.create(:name => params[:add_company][:name], :address=>params[:add_company][:address], :phone =>params[:add_company][:phone], :description => params[:add_company][:description])
    end
    redirect_to :action => :show_company, :id => @company.id
  end

  def del_company
    if user_type == "admin"
      @company = Company.find(params[:id])
      @company.destroy
    end
    redirect_to :action => :index
  end


  def show_company
    @company = Company.find(params[:id])
    @utype = user_type
  end

  def show_subrubric
    @subrubric = Subrubric.find_by_name(params[:sr])
    @utype = user_type
  end

  def show_rubric
    @rubric = Rubric.find_by_name(params[:r])
    @utype = user_type
  end

  def search
    @req = params[:search_form][:req].mb_chars.downcase
    regular = /#{@req}/
    @rubr_res = Rubric.all.select{|r| r.name.mb_chars.downcase =~ regular}
    @subr_res = Subrubric.all.select{|s| s.name.mb_chars.downcase =~ regular}
    @company_name_res = Company.all.select{|c| c.name.mb_chars.downcase =~ regular}
    @company_address_res = Company.all.select{|c| c.address.mb_chars.downcase =~ regular}
    @company_phone_res = Company.all.select{|c| c.phone.mb_chars.downcase =~ regular}
    @company_description_res = Company.all.select{|c| c.description.mb_chars.downcase =~ regular}
  end



end
