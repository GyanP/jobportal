class Api::V1::UsersController < Api::V1::BaseController

  def create
    prepare!([:name, :state, :city, :street, :role_id])
    begin
      user = User.new(signup_params)
      location = Geocoder.coordinates("#{user.street + " "+ user.city + " " + user.state}")
      user.latitude = location[0]
      user.longitude = location[1]
      if user.save!
        render json: {:success => true, :message => "User signup successfully"}
      else
        render json: {:success => false, :errors => "Something went wrong"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  def employer_jobs

    begin
      prepare!([:id])
      user = User.find(params[:id])
      if user.role.name == "Employer"
        post_jobs = Job.where(:user_id => user.id)
        if !post_jobs.blank?
          render json: post_jobs.to_json
        else
          render json: {:success => false, :message => "No record found"}
        end
      else
        render json: {:success => false, :message => "you are not a Employer"}
      end
    rescue => e
      handle_exception(e.message)
    end
  end

  private

  def signup_params
    params.require(:user).permit(:id, :name, :state, :city, :street, :zip, :latitude, :longitude, :fb_id, :role_id)
  end

end
