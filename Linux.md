## File system
| Path        | Function |
| ------------- | -----:|
| `/`      | Root directory of the entire file system |
| `/bin` | Essential command binaries |
| `/boot` | Boot loader files including kernels |
| `/dev` | Essential device files |
| `/etc` | System configuration files |
|  `/home` | Users' home directories |
| `/lib` | 32-bit system libraries |
| `lib64` | 64-bit system libraries |
| `/media` | Mount points for removable media |
| `/mnt` | Temporarily mounted filesystems |
| `/opt` | Optional application software packages |
| `/proc` | Virtual filesystem providing process and kernel info as files |
| `/root` | Home directory for the root user |
| `/run` | Run-time configuration data |
| `/sbin` | Essential system binaries |
| `/srv` | Site-specific data served by this system |
| `/sys` | Contains information about the devices connected to the computer |
| `/tmp` | Temporary files |
| `/usr` | Read-only user data; contains the majority of utilities and applications |
| `/var` | Variable files whose content is expected to change during normal operation |

## Be careful!
- Don't change default python setting like install another version, it may result in your failing to open terminal.
- And don't install other python version on the default, just use a docker or virtual environment if you need another version of python. 
  - What happened to me was, I installed Python 3.6 in Ubuntu 16.04, then after I upgrade to 18.04, first nvidia driver was having problems. I cannot start the system. Then my colleague helped me remove it inside `grub`. Then when I want to install ros2, it was always failing. Had errors like:
  ```
  The following packages have unmet dependencies:                                                                             
    ros-dashing-desktop : Depends: ros-dashing-action-tutorials but it is not going to be installed                                                     Depends: ros-dashing-composition but it is not going to be installed                               
                          Depends: ros-dashing-demo-nodes-cpp but it is not going to be installed                             
                          Depends: ros-dashing-demo-nodes-cpp-native but it is not going to be installed                                    
   ```
   - Finally found that this was due to the Python3.6 I installed before upgrading to 18.04. After removed the python3.6, I was able to install ros2.
