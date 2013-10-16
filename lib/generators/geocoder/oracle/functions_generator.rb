require 'rails/generators'

module Geocoder
  module Oracle
    class FunctionsGenerator < Rails::Generators::Base
      ActiveRecord::Base.establish_connection

      desc 'Creates a custom functions required for geocoding in the Oracle database'
      def pi_function
        function = %q(
          CREATE OR REPLACE FUNCTION PI
            RETURN NUMBER DETERMINISTIC IS
            PI NUMBER;
          BEGIN
            SELECT ACOS(-1) INTO PI FROM DUAL;
            RETURN PI;
          END PI;
        )
        ActiveRecord::Base.connection().execute(function)
      end
    end
  end
end