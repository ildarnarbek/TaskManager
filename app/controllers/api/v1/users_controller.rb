class Api::V1::UsersController < Api::V1::ApplicationController
    def show
      user = User.find(params[:id])
  
      respond_with(user, serializer: UserSerializer)
    end
  
    def index
      users = User.ransack(ransack_params).result
  
      respond_with(users, each_serializer: UserSerializer, root: 'items')
    end
  end