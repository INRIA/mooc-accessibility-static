---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
description: ""
player:
  mediaId: null
  poster: null
  additionalInformationTracks:
    - label: "Informations complémentaires"
      src: "additional-infos_fr.vtt"
      srcLang: "fr"
  sources:
    - label: "Face video"
      src: "standard.mp4"
      type: "video/mp4"
      selected: true
    - label: "Side video"
      src: "side.mp4"
      type: "video/mp4"
slides:
  sources:
    - label: "Slides de Présentation"
      src: "slides_fr.vtt"
      srcLang: "fr"
     - label: "Presentation Slides"
      src: "slides_en.vtt"
      srcLang: "en"
subtitles:
  sources:
    - label: "Sous-titres"
      src: "subtitles_fr.vtt"
      srcLang: "fr"
    - label: "Subtitles"
      src: "subtitles_en.vtt"
      srcLang: "en"
chapters:
  sources:
    - label: "Chapitres"
      src: "chapters_fr.vtt"
      srcLang: "fr"
    - label: "Chapters"
      src: "chapters_en.vtt"
      srcLang: "en"
---
