# seehaze (DSCKitaHack 2020 by DSC Malaysia)

Visualise haze from arounf the world to your phone.

## Problem

People who suffer from health risks that may worsen if exposed to unhealthy air conditions do not have streamlined indicators of the air quality in their area and must instead rely on technical jargon that they may not understand.

## Solution

SeeHaze solves this problem by visualizing the air visibility in the user's location in relation to the location's Air Quality Index(AQI) using Google Street View. The developers have managed to do this by blotting out the sky to minimize air visibility. The blotting becomes more pronounced when the AQI in the user's location increases. The developers have also added health warnings depending on the AQI of the user's location to help user's understand the health risks posed if they decide to leave their house.

## Objective

The objective of this application is to visualize air visibility in relation to a location's Air Quality Index which helps users easily find out the air quality in their area without needing to understand the technical jargon used to measure air quality.

## Technology

This application was developed using Google's UI toolkit, Flutter, that compiles applications for mobile, web and desktop. The developers also implemented several APIs into the application such as:

1) Place API - Retrieves place suggestions for the user when typing in the search bar
2) Geocoding API - Converts addresses into geographical coordinates
3) Worldwide Air Quality Index API (https://waqi.info)  - Retrieves the AQI from locations all over the globe 

This application also simulates a 360 degree view of the street by combining four 2D images from the user's perspective to simulate the onsite experience of being at the location.

## Instruction

Type in your location in the search bar and press Enter. Shortly after, a view of the user's street showing the air visibility in their area will appear on their screen.
