# Streamio Flash SDK

Easy to use library for integrating Streamio in your flash (actionscript 3.0) project. 

## Prerequisites

* Flash CS4 / Flex 3 or higher

## Installation

Copy the contents of the source directory into the directory containing your fla file. Or make sure you have a classpath to a directory containing the source.

## Usage

<code>
  import streamio.api.*
  
  StreamioVideo.load("4cd3bbcc11581e1f4d000103", onVideoLoaded)

  function onVideoLoaded(e:VideoEvent) {
    var video:StreamioVideo = e.video
    trace(video.title)
  }
</code>
