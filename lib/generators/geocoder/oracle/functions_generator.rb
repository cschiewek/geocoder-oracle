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
        puts 'PI() function added.'
      end

      def degrees_function
        function = %q(
          CREATE OR REPLACE FUNCTION DEGREES(RADIAN IN NUMBER)
            RETURN NUMBER DETERMINISTIC IS
            DEGREES NUMBER;
          BEGIN
            SELECT RADIAN * 57.2957795 INTO DEGREES FROM DUAL;
            RETURN DEGREES;
          END DEGREES;
        )
        ActiveRecord::Base.connection().execute(function)
        puts 'DEGREES(RADIAN) function added.'
      end

      def radians_function
        function = %q(
          CREATE OR REPLACE FUNCTION RADIANS(DEGREE IN NUMBER)
            RETURN NUMBER DETERMINISTIC IS
            RADIANS NUMBER;
          BEGIN
            SELECT DEGREE / 57.2957795 INTO RADIANS FROM DUAL;
            RETURN RADIANS;
          END RADIANS;
        )
        ActiveRecord::Base.connection().execute(function)
        puts 'RADIANS(DEGREE) function added.'
      end
    end
  end
end