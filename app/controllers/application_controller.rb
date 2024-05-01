class ApplicationController < ActionController::Base
  # 全てのコントローラーで SessionsHelpler モジュールを使用できるようにする
  include SessionsHelper
end
