# The micro-ROS_sensors_demo repository

![](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/micro-ROS/micro-ROS_sensors_demo/master/assets/diagrams/architecture.puml)

## Purpose of the project

The software is not ready for a production use.
It has neither been developed nor tested for a specific use case.
However, the license conditions of the applicable Open Source licenses allow you to adapt the software to your needs.
Before using it in a safety relevant setting, make sure that the software fulfills your requirements and adjust ot according to any applicable safety standards (e.g. ISO 26262).

## Hardware

The following is a list of the hardware needed to reproduce this demo:

* 1 x [STM32L4 Discovery kit IoT node](https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html),

## How to build and flash the firmware?

1. run the builder Docker:
```bash
docker-compose run stiot_builder
```

2. configure and build the micro-ROS firmware inside the Docker:
```bash
ros2 run micro_ros_setup configure_firmware.sh serialusb
ros2 run micro_ros_setup build_firmware.sh sensors_publisher
```

3. connect the board using the STLink USB port

4. flash the micro-ROS firmware:
```bash
ros2 run micro_ros_setup flash_firmware.sh
```

## How to use?

To start the application just one step is needed:

1. up the Docker Compose:

```bash
docker-compose up -d
```

To stop the application just down the Docker Compose:

```bash
docker-compose down
```