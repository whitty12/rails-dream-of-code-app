class AdminDashboardController < ApplicationController
    before_action :require_admin
    def index
        @current_trimester = Trimester.where("start_date <= ?", Date.today).where("end_date >= ?", Date.today).first
        @upcoming_trimester = Trimester.where("start_date > ?", Date.today).first
    end
end