Settings.read(Rails.root.join('config', 'settings.yml'))
Settings.define 'app.secret',               :required => true
Settings.define 'contingent.wsdl',          :required => true
Settings.define 'contingent.auth.login',    :required => true
Settings.define 'contingent.auth.password', :required => true
Settings.define 'errors.key',               :required => Rails.env.production?
Settings.define 'errors.host',              :required => Rails.env.production?

Settings.resolve!
