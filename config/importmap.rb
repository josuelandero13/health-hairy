# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap
pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.esm.js'
pin '@stimulus-components/rails-nested-form", to: "@stimulus-components--rails-nested-form.js'
pin 'tailwindcss-stimulus-components' # @6.1.2
