class MealsController < ApplicationController
  def index
    @q = Meal.ransack(params[:q])
    @meals = @q.result(:distinct => true).includes(:venue, :dish, :neighborhood).page(params[:page]).per(10)

    render("meals/index.html.erb")
  end

  def show
    @meal = Meal.find(params[:id])

    render("meals/show.html.erb")
  end

  def new
    @meal = Meal.new

    render("meals/new.html.erb")
  end

  def create
    @meal = Meal.new

    @meal.dish_id = params[:dish_id]
    @meal.venue_id = params[:venue_id]
    @meal.neighborhood_id = params[:neighborhood_id]

    save_status = @meal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meals/new", "/create_meal"
        redirect_to("/meals")
      else
        redirect_back(:fallback_location => "/", :notice => "Meal created successfully.")
      end
    else
      render("meals/new.html.erb")
    end
  end

  def edit
    @meal = Meal.find(params[:id])

    render("meals/edit.html.erb")
  end

  def update
    @meal = Meal.find(params[:id])

    @meal.dish_id = params[:dish_id]
    @meal.venue_id = params[:venue_id]
    @meal.neighborhood_id = params[:neighborhood_id]

    save_status = @meal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meals/#{@meal.id}/edit", "/update_meal"
        redirect_to("/meals/#{@meal.id}", :notice => "Meal updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Meal updated successfully.")
      end
    else
      render("meals/edit.html.erb")
    end
  end

  def destroy
    @meal = Meal.find(params[:id])

    @meal.destroy

    if URI(request.referer).path == "/meals/#{@meal.id}"
      redirect_to("/", :notice => "Meal deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Meal deleted.")
    end
  end
end
