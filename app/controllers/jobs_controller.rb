class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

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
    job = Job.new(job_params)
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
    #redirect_to job_path(@job)
    redirect_to jobs_path
  end

  def destroy
    # implement on your own!
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_job
   @job = Job.find(params[:id])
 end

end
