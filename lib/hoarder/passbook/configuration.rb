module Hoarder
  module Passbook
    class Configuration
      attr_accessor :base_path,
                    :logo,
                    :logo_2x,
                    :icon,
                    :icon_2x

      def initialize
        @base_path = '.'
        @logo = 'logo.png'
        @logo_2x = 'logo@2x.png'
        @icon = 'icon.png'
        @icon_2x = 'icon@2x.png'
      end

      def files
        [@logo, @logo_2x, @icon, @icon_2x]
      end
    end
  end
end
