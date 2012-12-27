module Bundler

  class CLI

    desc "gem-install", "Gem install the current environment to the system"
    def gem_install
      begin
        not_installed = Bundler.definition.missing_specs
      rescue GemNotFound, VersionConflict
        Bundler.ui.error "Your Gemfile's dependencies could not be satisfied"
        Bundler.ui.warn  "Install missing gems with `bundle install`"
        exit 1
      end

      if not_installed.any?
        Bundler.ui.error "The following gems are missing"
        not_installed.each { |s| Bundler.ui.error " * #{s.name} (#{s.version})" }
        Bundler.ui.warn "Installing missing gems with `gem install`"
        not_installed.each do |gem|
          puts "gem installing #{gem.name} --version=#{gem.version} ..."
          `gem install #{gem.name} --version=#{gem.version}`
        end
        exit 1
      else
        Bundler.load.lock
        Bundler.ui.info "The Gemfile's dependencies are satisfied"
      end
    end

  end

end