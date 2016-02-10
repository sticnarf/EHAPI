# EHAPI

This is an api server for exhentai.

With pre-installed authorized user, never worry about the panda!

## Usage

Generally, the main possible requests are as follows.

### Index

The json returned is an array containing information of galleries.

To fetch the latest gallery index:

```
GET /
```

To fetch the gallery index with the given page number:

```
GET /:page

# For example, to fetch page 2:
GET /2
```

To search with the given keyword:

```
GET /s/:keyword

# For example, to search "Asuka EVA":
GET /s/Asuka%20EVA
```

For more results, you can specify the page number:

```
GET /s/:keyword/:page

# For example: 
GET /s/Asuka%20EVA/5
```

To filter out some sorts, set the attribute of the sort to `0`.

For example:

```
GET /s/asuna?western=0
```

The default setting for all sorts is `1`:

```
GET /s/:keyword/:page?doujinshi=1&manga=1&artistcg=1&gamecg=1&western=1&non-h=1&imageset=1&cosplay=1&asianporn=1&misc=1
```

### Gallery Info

To get the information of a gallery, you need the `gid` and the `token`.

You can find these two attributes in the index json.

```
GET /g/:gid/:token
```

### Gallery Pictures

To get the link of the pictures:

```
GET /p/:gid/:page
```

In general, the url in the returned json directs to the Hentai@Home cluster, which is available for everyone.