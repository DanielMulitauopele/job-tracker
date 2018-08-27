class JobsController < ApplicationController
  def index
    # @company = Company.find(params[:company_id])
    # @jobs = @company.jobs
    @jobs = Job.all
  end

  def new
    #@company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    # @categories = Category.all
    # @companies  = Company.all
    @job = Job.find(params[:id])
  end

  def update
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    # implement on your own!
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
