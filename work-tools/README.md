# Compute SRE Tools (sretools)
The Compute SRE Tools provided in this program are designed to help make your overall job easier.  Below is some short explanation behind what each section has available to it.

Option 1 - Ticket Templates (Blanks)<br />
This option contains 6 different boiler plates for various ticket types.  A menu is presented and you can select which ticket you wish to get the boiler plate for.  It is displayed out in plain text for you to copy over to your ticket and add any required information needed.  See option 2 which prompts for the needed information and auto populates the ticket information.

Option 2 - Tickets<br />
This option contains 6 different boiler plates for various ticket types.  A menu is presented and you can select which ticket you wish to get the boiler plate for. From there a series of questions is asked pertaining to the specific ticket selected.  Once all the information is provided the ticket body will appear with all the information automatically plugged into its respective field. See option 1 which has the same ticket information but doesn't prompt for the information to fill it out.

Option 3 - Outage Tool<br />
When selecting this tool it will request the hostname of the server you wish to work with.  It will inquire to IMS and return the Hostname, Hardware ID, IP address and OS Password.  If will then prompt if you would like to sync the power on the host and start the diagnostics, by pressing 'Y' to continue or 'N' to cancel.  Once the sync power is completed you will be asked for the password to copy over a diagnostic script to the host you are working on.  Once copied the password will be requested once more and you will be logged into the host.  Run "bash diag.sh" and press enter to advance through the whole script.

Option 4 - Host Tools (Requires Host Information)<br />
Option4 explanation

Option 5 - DC Tools<br />
option 5 explanation

Option 6 - Read Me<br />
This option will display this readme text to the user from the Command Line Interface.
