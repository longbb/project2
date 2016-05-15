class StatisticsController < ApplicationController
  before_action :must_be_admin, only: [:index]

  def index
    time = Time.zone.now
    @number_members_today = Member.where(
      created_at: time.to_date.beginning_of_day..time
    ).count
    
    @number_posts_today = Post.where(
      created_at: time.to_date.beginning_of_day..time
    ).count

    @number_comments_today = Comment.where(
      created_at: time.to_date.beginning_of_day..time
    ).count

    startDate = 7.days.ago.to_date
    endDate = Time.now.to_date
    
    statistic_member = Member.statistic_member startDate, endDate
    number_members = statistic_member[:number_member]

    statistic_post = Post.statistic_post startDate, endDate
    number_posts = statistic_post[:number_post]

    statistic_comment = Comment.statistic_comment startDate, endDate
    number_comments = statistic_comment[:number_comment]

    date = statistic_member[:date]

    @number_posts_of_topic = Topic.statistic_posts_of_topic

    @number_members = {
      labels: date,
      datasets: [
        {
          fillColor: "#0800FF",
          strokeColor: "#0800FF",
          pointColor: "#0800FF",
          pointStrokeColor: "#fff",
          data: number_members
        }
      ]
    }

    @number_posts = {
      labels: date,
      datasets: [
        {
          fillColor: "#FF0018",
          strokeColor: "#FF0018",
          pointColor: "#FF0018",
          pointStrokeColor: "#fff",
          data: number_posts
        }
      ]
    }

    @number_comments = {
      labels: date,
      datasets: [
        {
          fillColor: "#00FFE7",
          strokeColor: "#00FFE7",
          pointColor: "#00FFE7",
          pointStrokeColor: "#fff",
          data: number_comments
        }
      ]
    }

    @options = {
      scaleBeginAtZero: true,
      scaleShowGridLines: true,
      scaleGridLineColor: "rgba(0,0,0,.05)",
      scaleGridLineWidth: 1,
      scaleShowHorizontalLines: true,
      scaleShowVerticalLines: true,
      barShowStroke: true,
      barStrokeWidth: 2,
      barValueSpacing: 5,
      barDatasetSpacing: 1,
      legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      responsive: true,
      maintainAspectRatio: true
    }
  end

  private
    def must_be_admin
      if logged_in?
        unless current_member.role == "admin"
          redirect_to root_path
          flash[:danger] = "Permission denied!"
        end
      else
        redirect_to login_url
          flash[:danger] = "Please login to continue!"
      end
    end
end
