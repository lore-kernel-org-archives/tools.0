Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.846.1587747886334292790
 for <tools@linux.kernel.org>;
 Fri, 24 Apr 2020 10:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MITRYEUx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f67.google.com with SMTP id t8so5017430qvw.5
        for <tools@linux.kernel.org>; Fri, 24 Apr 2020 10:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Qyv4lDlXGMAoqc27hwIn8fZB/oEiGUDc6DuEiGBhnf8=;
        b=MITRYEUxWAiekL+7cAMqW+8P1V7Yqsv7hGBDn3fU2fxT06ikz/l+odnEdtrPYqXl7O
         SAnGPh7WAvcOxHmFvY72vTzOY89sXdx1z5Z5L2hnOG/78QtUDvwR1hqCRBDPoU1I3dCo
         vVkSFCEoCcjV3SNTTZ2W4DDjrxloO6sH0Zmw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Qyv4lDlXGMAoqc27hwIn8fZB/oEiGUDc6DuEiGBhnf8=;
        b=Jli3JIjjbRwurrfNJUk5iEnzFxW7PJP9hf//U0hA0bxf+2tUQ7z3JQ9NbJMTYKxG7X
         DKrECVs1DimTRdOEe/Yr9iwLGeOy+LPyzQimyDHCQtYNYkuzwrVUh6K/n5ArXeVeiXxk
         GHz96qHIp5uQXKR9T34Lzr28nHw9kYna2dfjxNWW1KtuN1kPI+hCUSaOTnnCyL36eytX
         TWRFKOvVw9DBE4nTYXfZi2Smm3ZPeqJX50JSzYtaquLvhET+d95c69fBNDD4IS2wDh3e
         eod6SEgCVGHAXKZg/9sR4QOhtyf4HpwfMQwUkD0Ng2va1aNZQuceLsSdB0ckF3NCAPjv
         K9sg==
X-Gm-Message-State: AGi0PubBhpvWcyHUa3XcCLmmzCYUKgK/+QXUsYlyKaHFgY/lPZBhZR9J
	EZtIiXGSECYCWPfxRiP/u5pPGv8dEIE=
X-Google-Smtp-Source: APiQypKHrcIQANkuACYbMK1OsIPHwTlS2LaMw158iyr4LbDvazxEOmotFLboTcqCbCWejxHpdqtJ8Q==
X-Received: by 2002:a05:6214:9ce:: with SMTP id dp14mr10539194qvb.142.1587747885260;
        Fri, 24 Apr 2020 10:04:45 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id q32sm4482981qta.13.2020.04.24.10.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:04:44 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Fri, 24 Apr 2020 13:04:42 -0400
Date: Fri, 24 Apr 2020 13:04:42 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 v0.4.0 available with new features
Message-ID: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 101
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uo6griherb6nua7x"
Content-Disposition: inline

--uo6griherb6nua7x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

I am happy to release b4 version 0.4.0 that contains a set of=20
improvements and new features. To upgrade from pypi, run:

pip install --upgrade --user b4

Or you can clone the repository directly:
git clone https://git.kernel.org/pub/scm/utils/b4/b4.git -b stable-0.4.y b4

You can run ./b4.sh from the repository or set an alias/symlink to that=20
wrapper.

# Improvements

- When a series is missing patches, b4 is now able to backfill them from=20
  other mailing lists tracked on lore.kernel.org. This feature will be=20
  improved when public-inbox is able to collect a thread from across all=20
  sources.
- If both patch and metadata are identical between rerolls (v1 -> v2),=20
  b4 will automatically carry over trailers from v1 to v2. This is handy=20
  if there is an sob on [PATCH v2 7/15] from a maintainer that is=20
  missing from an identical [PATCH v3 7/15]. In my observation, this=20
  happens very rarely, though.
- Many bugfixes that were also backported into stable-0.3.y.

# New features

## b4 pr

You can now process pull requests in addition to patch series:

b4 pr <msgid>

  - downloads that message
  - parses the pull request
  - checks that the remote tip is where the message says it should be
  - makes sure the base-commit is present in the tree
  - makes sure the tip commit isn't already in one of the branches
  - checks if FETCH_HEAD already is at that commit
  - if the above two checks pass, performs a git fetch
  - runs pgp verify checks on FETCH_HEAD and shows the results

b4 pr --check <msgid>

  Runs all of the checks above, but doesn't perform the actual fetch.
  Useful if you don't remember if you've already processed a pull
  request or not.

b4 pr --explode <msgid>

  Runs basic sanity checks and then:

  - performs a git fetch
  - runs a "git format-patch" for base-commit..FETCH_HEAD
  - adds the same to/from/cc headers as in the pull request
  - properly threads each patch below the pull request
  - saves that into a <msgid>.mbox file

  The above is handy if you want to comment on something in a pull
  request and not have to hunt around for sender/cc information.

b4 pr --help

  - will show you more information about subcommands available

## b4 ty

Allows you to automate a lot of "thanks, applied" and "thanks, merged"=20
feedback for series and pull requests that were fetched with "b4 am" and=20
"b4 pr".

b4 ty --help

  - will show you information about subcommands available

### For patch series:

  - find all commits in the current branch that were made by you=20
    (committer=3Duser.email)
  - see if any of them match patch-id's or patch titles tracked from=20
    previous "b4 am" runs
  - create an automatic reply message with the summary of the commit and=20
    save it as a .thanks file in the output directory provided

### For pull requests
  - Match the tip commit in the pull request to your current branch
  - create an automatic reply message with the summary of the merge and=20
    save it as a .thanks file in the output directory provided

### Sending .thanks files

We do not currently automatically send the .thanks files, though this=20
functionality will be added in the future for the cases where we find a=20
[sendemail] section in .gitconfig.

For the moment, you can send these using "git send-email", "sendmail",=20
or you can use bsync or other tools to automatically upload them to the=20
Drafts folder of your mail service provider.

# Acknowledgements

I would like to thank Mark Brown for being a willing guinea pig for=20
trying out the "b4 ty" feature.

-K

--uo6griherb6nua7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXqMcJwAKCRC2xBzjVmSZ
bF4fAP95k29zIByVCpl/RhqcIvkqpUrgjqR/J4Ky+1zkuFLOygD+I9iUygdPccFF
RFINCuo6EAhjXk51lzyCowQf4iBrPQM=
=Ltu7
-----END PGP SIGNATURE-----

--uo6griherb6nua7x--
