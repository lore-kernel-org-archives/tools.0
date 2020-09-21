Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.46621.1600708017952669958
 for <tools@linux.kernel.org>;
 Mon, 21 Sep 2020 10:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=StnFiTy0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id 16so15919378qkf.4
        for <tools@linux.kernel.org>; Mon, 21 Sep 2020 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=mQheBbl/Envxc4mlK6rqmLVa1VigNOe54/9h0gT4kcY=;
        b=StnFiTy0RCRivBJcaZa7KEdIF9in6BDgFzoYNi07XP6YRcUL19NTgUITB1TBEhFcXg
         Ru2yVf2z+6Hsi7Ut5BQ1fCOO7RyqK1HWq8axp4UBlPnql+rIpSrYGXwBuHXOD9tMIoK7
         VcgWCCG/9UYSWUfsNzFhBmhXBC23FEIh7/1uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition;
        bh=mQheBbl/Envxc4mlK6rqmLVa1VigNOe54/9h0gT4kcY=;
        b=DZDv/C+USP2P9+1BHDL2yip6BdhXml/dE1KEPkJBg2dg3dh0Wi5CCvyszslCpLKB73
         eLTJs+6EcNMS8V/Gb1ttZo1oDNTR76hmMi2l27mA79eRBYk4iDBG32WEVUmuprgKqxML
         LepYJc59ywfFLee2bWaWl1seyUaWhBxqAYdGFrvI2+xDG/B0hcJ4yoJKi1QEDzRrVoon
         q9JLydE1RpiIkHHZ4cUDoHEAV+8I7YgHNvHa8qqrLePa4txdqYLXPOp/zf5cF8xYJ53I
         v3fQhsSUShC9rJmfizU4o42Aoys+igP+W3TQxmxsFvAhx0Q5mOj1GXMOJDl/rSBzsNyl
         vspg==
X-Gm-Message-State: AOAM533un8EuBMbX6NZWe7W+9ZJ0FNwD4TBKvvOvLpedWr/EU4x1/Asa
	9jBv+SNmjtFWEZLw8C/AM565cw==
X-Google-Smtp-Source: ABdhPJwNBPjWlIPRT4omUFip35s62/Vn8gKXKMZB15novcCArBYZg64QSG2WYnrz5Ih7raqifK2AxA==
X-Received: by 2002:a37:a84a:: with SMTP id r71mr663302qke.481.1600708014069;
        Mon, 21 Sep 2020 10:06:54 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id u18sm10671259qtk.61.2020.09.21.10.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 10:06:53 -0700 (PDT)
Date: Mon, 21 Sep 2020 13:06:51 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: git@vger.kernel.org
Cc: tools@linux.kernel.org
Subject: grokmirror-2.0 is available
Message-ID: <20200921170651.aszbydzvnj7l4y2w@chatter.i7.local>
Mail-Followup-To: git@vger.kernel.org, tools@linux.kernel.org
MIME-Version: 1.0
X-Groupsio-MsgNum: 207
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x4ff6avmflavdcyx"
Content-Disposition: inline

--x4ff6avmflavdcyx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

I am pleased to announce version 2.0 of kernel.org's git mirroring=20
software, grokmirror. This is a major rewrite that intentionally breaks=20
the upgrade path from grokmirror-1.x due to significant backend changes=20
requiring replica administrator's thoughtful consideration -- please see=20
the UPGRADING.rst document provided with this release.

## New in grokmirror-2.0

- Drop support for python < 3.6
- Introduce "object storage" repositories that benefit from git-pack
  delta islands and improve overall disk storage footprint (results will=20
  directly depend on the number of forks).
- Drop dependency on GitPython: use git calls directly for all operations
- Remove progress bars to slim down dependencies (drops enlighten)
- Make grok-pull operate in daemon mode (with -o) (see contrib for
  systemd unit files). This is more efficient than the cron mode when
  run very frequently.
- Provide a socket listener for pubsub push updates (see contrib for
  Google pubsubv1.py).
- Merge fsck.conf and repos.conf into a single config file. This
  requires creating a new configuration file after the upgrade. See
  UPGRADING.rst for details.
- Record and propagate HEAD position using the manifest file.
- Add grok-bundle command to create clone.bundle files for CDN-offloaded
  cloning (mostly used by Android's repo command).
- Add SELinux policy for EL7 (see contrib).

## Object Storage Repositories

Grokmirror 2.0 introduces the concept of "object storage repositories", whi=
ch
aims to optimize how repository forks are stored on disk and served to the
cloning clients.

When grok-fsck runs, it will automatically recognize related repositories by
analyzing their root commits. If it finds two or more related repositories,=
 it
will set up a unified "object storage" repo and fetch all refs from each
related repository into it.

For example, you can have two forks of linux.git:
  torvalds/linux.git:
    refs/heads/master
    refs/tags/v5.0-rc3
    ...

and its fork:

  maintainer/linux.git:
    refs/heads/master
    refs/heads/devbranch
    refs/tags/v5.0-rc3
    ...

Grok-fsck will set up an object storage repository and fetch all refs from =
both
repositories:

  objstore/[random-guid-name].git
     refs/virtual/[sha1-of-torvalds/linux.git:12]/heads/master
     refs/virtual/[sha1-of-torvalds/linux.git:12]/tags/v5.0-rc3
     ...
     refs/virtual/[sha1-of-maintainer/linux.git:12]/heads/master
     refs/virtual/[sha1-of-maintainer/linux.git:12]/heads/devbranch
     refs/virtual/[sha1-of-maintainer/linux.git:12]/tags/v5.0-rc3
     ...

Then both torvalds/linux.git and maintainer/linux.git with be configured to=
 use
objstore/[random-guid-name].git via objects/info/alternates and repacked to
just contain metadata and no objects.

The alternates repository will be repacked with "delta islands" enabled,
which should help optimize clone operations for each "sibling"
repository.

Please see the example grokmirror.conf for more details about configuring
objstore repositories.

## Space savings using object storage repositories

Any disk space savings will depend on how many repositories are forks of=20
each other. For git.kernel.org, which already aggressively used=20
alternates for all linux.git forks, we saw reduction from 60GB to 20GB=20
for the entirety of git.kernel.org content. On some of the=20
codeaurora.org systems, especially those containing a lot of pre-release=20
forks of entire AOSP repo collections, we saw space usage go from 3TB to=20
under 1TB.

## Stability

This release has proven pretty stable and has been operating on=20
git.kernel.org and a subset of codeaurora.org systems for over the past=20
month. However, since the trickiest part is initial repository=20
conversion towards the use of object storage repos, we urge proceeding=20
with caution. Please study the UPGRADING.rst document before making any=20
changes to your infrastructure.

With all support questions, please email tools@linux.kernel.org.

Best regards,
Konstantin

--x4ff6avmflavdcyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX2jdnwAKCRC2xBzjVmSZ
bGF9AP0TDwe9jUmlWZGW9LEjHjSXXKnOAVB4C+0UupoTD0/4/AEAxXW2pfirzX84
vW6hMB+fhIDuHdqL8mEGfCLvWatSdwA=
=Ieyd
-----END PGP SIGNATURE-----

--x4ff6avmflavdcyx--
