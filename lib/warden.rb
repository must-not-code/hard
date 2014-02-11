class HardRandom < Sinatra::Base
  use Rack::Session::Cookie, secret: 'N0th1ngIs$ecret0nThe!nt3rn3t'
  use Warden::Manager do |config|
    config.serialize_into_session{|user| user.id}
    config.serialize_from_session{|id| User.get(id)}
    config.failure_app = self
    config.scope_defaults :default,
                          strategies: [:password],
                          action: 'unauthenticated'
  end

  Warden::Manager.before_failure do |env, opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:password) do
    def valid?
      params['username'] && params['password']
    end

    def authenticate!
      user = User.first(username: params['username'])

      if user.nil?
        fail!
      elsif user.authenticate(params['password'])
        success!(user)
      else
        fail!
      end
    end
  end
end
