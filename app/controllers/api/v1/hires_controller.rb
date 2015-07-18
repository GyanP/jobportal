class Api::V1::HiresController < Api::V1::BaseController

  def create
    prepare!([:job_id, :user_id, :applicant_id])
    begin
      job = Job.find(params[:job_id])
      if job.user_id == params[:user_id]
        hire = Hiring.new(hire_params)
        if hire.save!
          job.update_attributes(current_status: "hired")
          render json: {:success => true, :message => "You have hired for this job"}
        else
          render json: {:success => false, :errors => "No record found"}
        end
      else
        render json: {:success => false, :errors => "Only Employer have hiring permission"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  private

  def hire_params
    params.require(:hire).permit(:job_id, :user_id, :applicant_id)
  end

end
