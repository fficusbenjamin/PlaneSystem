package body wind with SPARK_Mode is
   
   function Flow return Weather is
      result: Weather := (strgt => 90, dir => Up);
   begin
      return result;
      end Flow;  

end wind;
