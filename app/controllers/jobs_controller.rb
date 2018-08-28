class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    company = Company.find(params[:company_id])
    job = company.jobs.create(job_params)
    redirect_to company_jobs_path
  end

  def show
    require "pry"; binding.pry
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job.update(job_params)
    redirect_to jobs_path
  end

  def destroy
    # implement on your own!
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
