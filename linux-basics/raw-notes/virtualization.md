## Virtualization and Hypervisors

Before starting, let’s understand what virtualization is.

Normally, you can have three different physical servers, each running different operating systems and using different resources.
But you can achieve the same thing on a single physical machine by sharing its hardware and resources.

The process of dividing a single physical machine into multiple isolated virtual machines, each with its own OS and resources, is called virtualization.

It’s like having many mini computers inside your physical computer.
The software used to create virtual machines and allocate resources using virtualization is called a hypervisor.
Eg: VMware, VirtualBox

---

## Types of Hypervisors
Type 1 Hypervisor (Bare Metal):
* Installed directly on the hardware (no OS required)
* Has full access to hardware resources
* Provides better performance
* Commonly used in cloud and enterprise servers
* Example: VMware ESXi

Type 2 Hypervisor (Hosted):
* Installed on top of an operating system as an application
* The OS controls resource allocation
* Slightly lower performance due to the extra OS layer
* Mostly used for learning and development
* Example: Oracle VirtualBox

---