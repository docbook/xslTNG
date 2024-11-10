def matching_images(self, iname=None):
    """Filter the image list to the ones that match the
    specified iname.

    """
    if iname:
        namere = re.compile(r"^%s" % iname)
    else:
        return list(self.image)

    # Is it a id?
    filtered = self._data_match(self.image, namere)

    if not filtered:
        # Is it a repository name?
        filtered = self._data_match(self.image,
                                    namere, "repository")

    if not filtered:
        # Is it a tag?
        filtered = self._data_match(self.image, namere, "tag")

    return list(filtered)
