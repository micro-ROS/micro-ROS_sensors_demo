# micro-ROS Sensors Demo

This demo illustrates micro-ROS capabilities in combination with the [STM32L4 Discovery kit IoT node](https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html) node and [Zephyr RTOS](https://www.zephyrproject.org/).
micro-ROS integration with common ROS 2 tools such as [RQt](http://wiki.ros.org/rqt) are shown in this demo case of use. The used board is an ST development board with a complete set of sensors and communication peripherals:  3-axis inertial units (IMU), environmental sensors (temperature, humidity, and pressure), a time of flight laser ranging sensor, NFC, low-power radio and 802.11 devices.

The vast majority of these peripherals are out-of-the-box supported by Zephyr RTOS. So, by using the micro-ROS + Zephyr port, this demo case will put some of these sensors' measurements to the ROS 2 world. Concretely, the 3-axis accelerometer data will be published on `/sensors/imu` ROS 2 topic as a three-position array of 32 bits floating-point data. The range measurement of the time of flight laser sensor will be published on `/sensors/tof` ROS 2 topic. 

Finally, in order to test communications from the ROS 2 world to the embedded board running micro-ROS, the board is subscribed to a simple boolean topic on `/sensors/led` that will turn a LED on and off.

This demo is also focused on the micro-ROS's middleware layer where eProsima Micro XRCE-DDS is the default implementation. This software, base on the [DDS-XRCE](https://www.omg.org/spec/DDS-XRCE/About-DDS-XRCE/) wire protocol, offers to micro-ROS client-server communication with the following characteristics:

 * Multi-transport protocol support (UDP, TCP and Serial).
 * Peer-to-peer communication.
 * Server discovery.
 * Best-effort and reliable communication.
 * Message fragmentation.

This demo aims to be an entry point for further IoT development using the STM32L4 Discovery kit IoT node, Zephyr and micro-ROS. It will also show the ease of use of the micro-ROS development environment for a ROS 2 developer.
![](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/micro-ROS/micro-ROS_sensors_demo/master/assets/diagrams/architecture.puml)

## Hardware

The following is a list of the hardware needed to reproduce this demo:

* 1 x [STM32L4 Discovery kit IoT node](https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html)
* 1 x MicroUSB to USB cable.

## How to build and flash the firmware?

1. Run the builder Docker:
```bash
docker-compose run stiot_builder
```
This demo aims to be an entry point for further IoT development using STM32L4 Discovery kit IoT node, Zephyr and micro-ROS. It will also show the ease of use of the micro-ROS development environment for a ROS 2 developer.

2. Configure and build the micro-ROS firmware inside the Docker:
```bash
ros2 run micro_ros_setup configure_firmware.sh sensors_publisher --transport serial-usb
ros2 run micro_ros_setup build_firmware.sh 
```

3. Connect the board using the STLink USB port and make sure the board is supplied by `5V_ST_LINK` in the bottom supply jumpers.
4. Flash the micro-ROS firmware:
```bash
ros2 run micro_ros_setup flash_firmware.sh
```

## How to use?

To start the application just two steps are needed:

1. Connect host USB to your computer. You can disconnect the STLink USB port and modify the board supply jumper on the bottom layer to `5V_USB_FS`.

2. Remember to enable X11 sharing for all hosts with: `xhost +`

3. Up the Docker Compose:

```bash
docker-compose up -d
```

To stop the application just down the Docker Compose:

```bash
docker-compose down
```

## Purpose of the Project

This software is not ready for production use. It has neither been developed nor
tested for a specific use case. However, the license conditions of the
applicable Open Source licenses allow you to adapt the software to your needs.
Before using it in a safety relevant setting, make sure that the software
fulfills your requirements and adjust it according to any applicable safety
standards, e.g., ISO 26262.

## License

This repository is open-sourced under the Apache-2.0 license. See the [LICENSE](LICENSE) file for details.

For a list of other open-source components included in ROS 2 system_modes,
see the file [3rd-party-licenses.txt](3rd-party-licenses.txt).

## Known Issues/Limitations

There are no known limitations.