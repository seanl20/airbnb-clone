# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "el-transition" # @0.0.7
pin "axios", to: "https://cdn.skypack.dev/axios@1.2.0"
pin "geolib", to: "https://cdn.jsdelivr.net/npm/geolib@3.3.4/+esm"
pin "lodash-es", to: "https://cdn.jsdelivr.net/npm/lodash-es@4.17.21/+esm"
pin "vanillajs-datepicker", to: "https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.3.4/+esm" # @1.3.4
