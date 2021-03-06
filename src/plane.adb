with Ada.Text_IO; use Ada.Text_IO;

package body Plane with
SPARK_Mode
is

   procedure TakingOff(eolo: in Weather) is
   begin
      if
        (Jet.Status = Idle and Jet.CockpitDoors = Locked and
           Jet.ExternalDoors = Locked and Jet.Tank > 25 and Jet.Ignition = On  and
             Eolo.strgt < UnsafeTreshold)
      then
         Jet.Status := TakingOff;
      else Put_Line("Could not take off" );
      end if;
   end TakingOff;

   procedure Flying is
   begin
      if (Jet.Status = TakingOff and Jet.Velocity >= 200 and Jet.Height >= 300)
      then
         Jet.Status := Flying;
      end if;
   end Flying;

   procedure LowFuel is
   begin
      if (Jet.Status = Flying and Jet.Tank < 30) then
         Jet.FuelLight := FLASHING;
         Put_Line ("LOW FUEL, LAND!" & Jet.FuelLight'Image);

      end if;
   end LowFuel;

   procedure SpeedLimitsFast is
   begin
      if (Jet.Status = Flying and Jet.Velocity > 600) then
         Jet.SpeedLight := FLASHING;
         Put_Line
           ("Flying to Fast!" & Jet.Velocity'Image & " " &
              Jet.SpeedLight'Image);
      end if;

   end SpeedLimitsFast;

   procedure SpeedLimitsSlow is
   begin

      if (Jet.Status = Flying and Jet.Velocity < 200) then
         Jet.SpeedLight := FLASHING;
         Put_Line
           ("Flying to Slow!" & Jet.Velocity'Image & " " &
              Jet.SpeedLight'Image);
      end if;
   end SpeedLimitsSlow;

   procedure AltitudeLimitsHigh is
   begin
      if (Jet.Status = Flying and Jet.Height > 800) then
         Jet.AltiLight := FLASHING;
         Put_Line
           ("Flying to High!" & Jet.Height'Image & " " & Jet.AltiLight'Image);
      end if;

   end AltitudeLimitsHigh;

   procedure AltitudeLimitsLow is
   begin

      if (Jet.Status = Flying and Jet.Height < 300) then
         Jet.AltiLight := FLASHING;
         Put_Line
           ("Flying to Low!" & Jet.Height'Image & " " & Jet.AltiLight'Image);
      end if;
   end AltitudeLimitsLow;

   procedure LandingProcedure is
   begin
      if (Jet.Status = Landing and Jet.Height = 200 and Jet.Velocity = 100)
      then
         Jet.Wheels := Deployed;
         Put_Line ("Landing Gear Deployed");
      end if;
   end LandingProcedure;

   procedure Towed is
   begin
      if (Jet.Status = Landing and Jet.Height = 0 and Jet.Velocity = 0) then
         Jet.Ignition := Off;
         Put_Line
           ("The plane is being towed, the engine is: " & Jet.Ignition'Image);
      end if;
   end Towed;

   procedure IncreasingSpeed is
   begin

      Jet.Velocity := Jet.Velocity + 10;
      Put_Line ("Jet Speed is: " & Jet.Velocity'Image);

   end IncreasingSpeed;

   procedure IncreasingAltitude is
   begin
      Jet.Height := Jet.Height + 20;
      Put_Line ("Jet Height is: " & Jet.Height'Image);
      if (Jet.Height > 25 and Jet.Wheels = Deployed) then
         Jet.Wheels := Retract;
         Put_Line ("Landing Gear Retracted");

      end if;

   end IncreasingAltitude;

   procedure DecreasingSpeed is
   begin
      Jet.Velocity := Jet.Velocity - 10;
      Put_Line ("Jet Speed is: " & Jet.Velocity'Image);
   end DecreasingSpeed;

   procedure DecreasingAltitude is
   begin
      Jet.Height := Jet.Height - 20;
      Put_Line ("Jet Height is: " & Jet.Height'Image);
   end DecreasingAltitude;

   procedure BurningFuel is
   begin
      if (Jet.Status = Flying and Jet.Tank >= 10) then
         Jet.Tank := Jet.Tank - 10;
      end if;
   end BurningFuel;

   procedure UpwindBF is
   begin
      if (Jet.Status = Flying and Jet.Tank >= 10) then
         Jet.Tank := Jet.Tank - 20;
      end if;
   end UpwindBF;

end Plane;
