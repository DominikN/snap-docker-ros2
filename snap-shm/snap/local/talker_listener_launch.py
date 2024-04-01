from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='demo_nodes_cpp',
            namespace='demo',
            executable='talker',
            name='talker'
        ),
        Node(
            package='demo_nodes_cpp',
            namespace='demo',
            executable='listener',
            name='listener'
        )
    ])
