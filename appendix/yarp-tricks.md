# YARP Tricks

* [Yarp RPC commands (VOCABs)](#yarp-rpc-commands-vocabs)
    * [remote_controlboard](#remote_controlboard)
        * [encoder commands](#encoder-commands)
        *   [control modes](#control-modes)
        * [in pos mode](#in-pos-mode)
        * [in vel mode](#in-vel-mode)
        * [in torq mode](#in-torq-mode)
        * [in icur mode](#in-icur-mode)
        * [limits](#limits)
        * [remote calibrator](#remote-calibrator)
        * [remote variables](#remote-variables)
    * [analogsensorClient](#analogsensorclient)
        * [calibration](#calibration)
* [Edit .ini config files in Calc (Excel)](#edit-ini-config-files-in-calc-excel)

## Yarp RPC commands (VOCABs)
Note that this is a hack. VOCABs may be updated without warning. The recommended YARP-ish way is via YARP_dev interfaces. An interactive way to do this is via an `ipython` console and following the [yarp-devices Python examples](https://github.com/roboticslab-uc3m/yarp-devices/tree/develop/examples/python) ([perma](https://github.com/roboticslab-uc3m/yarp-devices/tree/64831bcd9acad3748760490b75723cf5ef7400b3/examples/python)).

### remote_controlboard

#### encoder commands
* query encoder reads:
```
[get] [enc] 0
[get] [encs]
```

* get estimated instantaneous speeds:
```
[get] [esp] 0
[get] [esps]
```

* get estimated instantaneous accelerations:
```
[get] [eac] 0
[get] [eacs]
```

#### control modes
* get control modes:
```
[get] [icmd] [cmod] 0
[get] [icmd] [cmds]
[get] [icmd] [cmog] (0 2 4)
```

* set pos mode
```
[set] [icmd] [cmod] 0 [pos]
[set] [icmd] [cmds] ([pos] [pos] [pos] [pos] [pos] [pos])
[set] [icmd] [cmog] (0 2 4) ([pos] [pos] [pos])
```

* set vel mode
```
[set] [icmd] [cmod] 0 [vel]
[set] [icmd] [cmds] ([vel] [vel] [vel] [vel] [vel] [vel])
[set] [icmd] [cmog] (0 2 4) ([vel] [vel] [vel])
```

* set torque mode
```
[set] [icmd] [cmod] 0 [torq]
[set] [icmd] [cmds] ([torq] [torq] [torq] [torq] [torq] [torq])
[set] [icmd] [cmog] (0 2 4) ([torq] [torq] [torq])
```

* set current mode (same as torque mode in TechnosoftIpos)
```
[set] [icmd] [cmod] 0 [icur]
[set] [icmd] [cmds] ([icur] [icur] [icur] [icur] [icur] [icur])
[set] [icmd] [cmog] (0 2 4) ([icur] [icur] [icur])
```

#### in pos mode
* set position
```
[set] [pos] 0 10.0
[set] [poss] (10.0 10.0 10.0 10.0 10.0 10.0)
[set] [posg] 3 (0 2 4) (10.0 10.0 10.0)
```

* set ref velocities
```
[set] [vel] 0 10.0
[set] [vels] (10.0 10.0 10.0 10.0 10.0 10.0)
[set] [velg] 3 (0 2 4) (10.0 10.0 10.0)
```

* set ref accelerations
```
[set] [acc] 0 10.0
[set] [accs] (10.0 10.0 10.0 10.0 10.0 10.0)
[set] [accg] 3 (0 2 4) (10.0 10.0 10.0)
```

* check if motion done:
```
[get] [don] 0
[get] [dons]
[get] [dong] 3 (0 2 4)
```

* command stop:
```
[set] [sto] 0
[set] [stos]
[set] [stog] (0 2 4)
```

#### in vel mode
* move in vel mode
```
[set] [vmos] (5.0 5.0 5.0)
```

#### in torq mode
* get actual torque
```
[get] [torq] [trq] 0
```

* set reference torque
```
[set] [torq] [ref] 0 1.0
```

#### in icur mode
* get reference current
```
[get] [icur] [ref] 0
```

#### limits
* get pos limits:
```
[get] [llim] 0
```

* get vel limits:
```
[get] [vlim] 0
```

#### remote calibrator
* homing:
```
[set] [reca] [hom] 0
[set] [reca] [homs]
```

#### remote variables
Some specific to [CanBusControlboard](https://github.com/roboticslab-uc3m/yarp-devices/tree/develop/libraries/YarpPlugins/CanBusControlboard) ([perma](https://github.com/roboticslab-uc3m/yarp-devices/tree/bd1a72b63dd22b670fd1e21ff7d670254c195522/libraries/YarpPlugins/CanBusControlboard)):
```
[get] [ivar] [lvar]
[get] [ivar] [mvar] id15-ipos
[set] [ivar] [mvar] id15-ipos (linInterp ((mode pt) (bufferSize 1)))
```

### analogsensorClient

#### calibration
* calibrate channel (single sensor)
```
[iana] [calc] 0
```

* calibrate all sensors
```
[iana] [cal]
```


## Edit .ini config files in Calc (Excel)
Click `Separated by space` and `Merge delimiters`.
```bash
#!/bin/sh
openoffice.org -calc launchManipulation.ini
# libreoffice -calc launchManipulation.ini
sed -i 's/\"//g' launchManipulation.ini
```
