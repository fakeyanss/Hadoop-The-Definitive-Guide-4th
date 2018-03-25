# Data Format

The data we will use is from the National Climatic Data Center, or NCDC. The data is stored using a line-oriented ASCII format, in which each line is a record. The format supports a rich set of meteorological elements, many of which are optional or with variable data lengths. For simplicity, we focus on the basic elements, such as temperature, which are always present and are of fixed width.

Example 2-1 shows a sample line with some of the salient fields annotated. The line has been split into multiple lines to show each field; in the real file, fields are packed into one line with no delimiters.

Example 2-1. Format of a National Climatic Data Center record

||||
- | - | -
| 0057 |
| 332130 | # | USAF weather station identifier |
| 99999 | # | WBAN weather station identifier |
| 19500101 | # | observation date |
| 0300 | # | observation time |
| 4 |
| +51317 | # | latitude (degrees x 1000) |
| +028783 | # | longitude (degrees x 1000) |
| FM-12 | | |
| 0171 | # | elevation (meters) |
| 99999 | | |
| V020 | | |
| 320 | # | wind direction (degrees) |
| 1 | # | quality code |
| N | | |
| 0072 | | |
| 1 | | |
| 00450 | # | sky ceiling height (meters) |
| 1 | # | quality code |
| C | | |
| N | # | |
| 010000 | # | visibility distance (meters) |
| 1 | # | quality code |
| N | | |
| 9 | | |
| -0128 | # | air temperature (degrees Celsius x 10) |
| 1 | # | quality code |
| -0139 | # | quality code |
| 1 | # | dew point temperature (degrees Celsius x 10) |
| 10268 | # | atmospheric pressure (hectopascals x 10) |
| 1 | # | quality code |

