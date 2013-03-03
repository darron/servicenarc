Admin.controllers :services do

  get :index do
    @services = Service.all
    render 'services/index'
  end

  get :new do
    @service = Service.new
    render 'services/new'
  end

  post :create do
    @service = Service.new(params[:service])
    if @service.save
      flash[:notice] = 'Service was successfully created.'
      redirect url(:services, :edit, :id => @service.id)
    else
      render 'services/new'
    end
  end

  get :edit, :with => :id do
    @service = Service.get(params[:id])
    render 'services/edit'
  end

  get :show, :with => :id do
    @service = Service.get(params[:id])
    @nodes = ServiceHit.list_members(@service.url)
    @checkins = ServiceHit.nodes_checkin_list(@service.url, @nodes)
    render 'services/show'
  end

  put :update, :with => :id do
    @service = Service.get(params[:id])
    if @service.update(params[:service])
      flash[:notice] = 'Service was successfully updated.'
      redirect url(:services, :edit, :id => @service.id)
    else
      render 'services/edit'
    end
  end

  delete :destroy, :with => :id do
    service = Service.get(params[:id])
    if service.destroy
      flash[:notice] = 'Service was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Service!'
    end
    redirect url(:services, :index)
  end
end
