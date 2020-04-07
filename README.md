# micro-ROS Sensors Demo

This demo illustrates micro-ROS capabilities in combination with the [STM32L4 Discovery kit IoT node](https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html) node and [Zephyr RTOS](https://www.zephyrproject.org/).
micro-ROS integration with common ROS 2 tools such as [RQt](http://wiki.ros.org/rqt) are shown in this demo case of use. The used board is an ST development board with a complete set of sensors and communication peripherals:  3-axis inertial units (IMU), environmental sensors (temperature, humidity, and pressure), a time of flight laser ranging sensor, NFC, low-power radio and 802.11 radio devices.

The vast majority of these peripherals are out-of-the-box supported by Zephyr RTOS. So, by using the micro-ROS + Zephyr port, this demo case will put some of these sensors' measurements to the ROS 2 world. Concretely, the 3-axis accelerometer data will be published on `/sensors/imu` ROS 2 topic as a three-position array of 32 bits floating-point data. The range measurement of the time of flight laser sensor will be published on `/sensors/tof` ROS 2 topic. 

Finally, in order to test communications from ROS 2 world to the embedded board running micro-ROS, the board is subscribed to a simple boolean topic on `/sensors/led` that will turn on and off a LED.

This demo aims to be an entry point for further IoT development using STM32L4 Discovery kit IoT node, Zephyr and micro-ROS. It will also show the ease of use of the micro-ROS development environment for a ROS 2 developer.
![](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/micro-ROS/micro-ROS_sensors_demo/master/assets/diagrams/architecture.puml)

## Purpose of the project

The software is not ready for a production use.
It has neither been developed nor tested for a specific use case.
However, the license conditions of the applicable Open Source licenses allow you to adapt the software to your needs.
Before using it in a safety relevant setting, make sure that the software fulfills your requirements and adjust ot according to any applicable safety standards (e.g. ISO 26262).

## Hardware

The following is a list of the hardware needed to reproduce this demo:

* 1 x [STM32L4 Discovery kit IoT node](https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html)
* 1 x MicroUSB to USB cable

## How to build and flash the firmware?

1. Run the builder Docker:
```bash
docker-compose run stiot_builder
```

2. Configure and build the micro-ROS firmware inside the Docker:
```bash
ros2 run micro_ros_setup configure_firmware.sh sensors_publisher --transport serial-usb
ros2 run micro_ros_setup build_firmware.sh 
```

3. Connect the board using the STLink USB port

4. Flash the micro-ROS firmware:
```bash
ros2 run micro_ros_setup flash_firmware.sh
```

## How to use?

To start the application just one step is needed:

1. Connect host USB to your computer. You can disconnect the STLink USB port and modify the board supply jumper on the bottom layer.

2. Up the Docker Compose:

```bash
docker-compose up -d
```

To stop the application just down the Docker Compose:

```bash
docker-compose down
```
