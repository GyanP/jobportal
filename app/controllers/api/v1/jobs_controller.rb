class Api::V1::JobsController < Api::V1::BaseController

  def create
    prepare!([:user_id, :job_title, :job_description, :job_state, :job_city, :job_street, :current_status])
    begin
      user = User.find(params[:user_id])
      if user.role.name == "Employer"
        job = Job.new(job_params)
        location = Geocoder.coordinates("#{job.job_street + " "+ job.job_city + " " + job.job_state}")
        job.job_latitude = location[0]
        job.job_longitude = location[1]
        if job.save!
          render json: {:success => true, :message => "Job created successfully"}
        end
      else
        render json: {:success => false, :errors => "Something went wrong"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  def applicant
    prepare!([:id, :user_id])
    begin
      job_applicant = JobApplicant.new(job_applicant_params)
      if job_applicant.save!
        render json: {:success => true, :message => "You have successfully apply this jobs"}
      else
        render json: {:success => false, :errors => "Something went wrong"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  def job_applicants
    begin
      params[:job_id] = params[:id]
      job_applicants = JobApplicant.where(:job_id => params[:job_id])
      if !job_applicants.blank?
        render json: job_applicants.to_json
      else
        render json: {:success => false, :errors => "No applicants apply for this job"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  def search
    prepare!([:user_id])
    begin
      user = User.find(params[:user_id])
      jobs = Job.near(["#{user.latitude}","#{user.longitude}"], 30)
      if !jobs.blank?
        render json: jobs.to_json
      else
        render json: {:success => false, :errors => "No record found"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  private

  def job_applicant_params
    params[:job_id] = params[:id]
    params.permit(:job_id, :applicant_id)
  end

  def job_params
    params.require(:job).permit(:user_id, :job_title, :job_description, :job_state, :job_city, :job_street, :job_zip, :job_latitude, :job_longitude, :current_status)
  end

end
