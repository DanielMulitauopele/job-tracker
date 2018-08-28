class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    # require "pry"; binding.pry
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    company = Company.find(params[:company_id])
    job = company.jobs.create(job_params)
    redirect_to company_jobs_path #See update
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    # require "pry"; binding.pry
  end

  def update
    @job.update(job_params)
    redirect_to company_jobs_path(@job.company)
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
