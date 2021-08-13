Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECBF2FB0
	for <tools@linux.kernel.org>; Fri, 13 Aug 2021 15:01:38 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id e14so11066714qkg.3
        for <tools@linux.kernel.org>; Fri, 13 Aug 2021 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=675HuwNOHl9B8md7Z+uwVbLsOrfArH3QajL0YlKHUKU=;
        b=DIKHw+L8OL739PbTEYgrnlBl9XVhUL8UjsRe7lduusDTRXBupy6kS0uAoPLDSmwRND
         0pW5OPFte2CPfNsLImVO2EaYG1HKu6vgGTUOU44xvjzIqdm4dGV+aUWHj0PhAZSuz6RP
         dP3xWHulwRqEm4yEKwx/LOm5cn3Oml+lGUfbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=675HuwNOHl9B8md7Z+uwVbLsOrfArH3QajL0YlKHUKU=;
        b=rMzQ4S1v9UVzQP0Z7d8uO7G6zbQLhbuZg/5BpW3jN2ffRl6Y1JpeCNLYyslEk0n434
         eonDbW5OGERR+XEe4y+AJRLaEJ6Sfv263dZfu3tvYq3ye7pUEMlJ4NqlEbrR/1ghG4Zo
         pNgF5etN2vBMWw8+/1FNmVg8cRsp5b1zfsKdUGyyP9YbOiQzV2tw2yQ23ad19PAVP3PH
         80+PrAmZK08PFQISma0T3a6IwLNWlTKb3f5rg8uepAZ6vrcpmtTG++FiaMc1WeWB8NP3
         m1JR53yh0cGcM5R5oNZFRE5J66/aBURFp30ht1BKMlJodUmIx3tfgN6LuE8TRTrWGsRX
         AUXw==
X-Gm-Message-State: AOAM533P0zK8Rezv9uKHRYUslKxoiwyqzoTpZpdY2YLTlKTIYdxWAabY
	U/fckamH7SczPk07bDlITxpQ//ROHWTHxEOF
X-Google-Smtp-Source: ABdhPJzi8yDB3b5WHEgOq6PKGCh96XXb4iHCDIfypW8/fHo2bbUCHCmE1hTxyBxfhjK9IePKLTFIwg==
X-Received: by 2002:a05:620a:4046:: with SMTP id i6mr2630978qko.406.1628866897181;
        Fri, 13 Aug 2021 08:01:37 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id p4sm1051722qkk.12.2021.08.13.08.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:01:36 -0700 (PDT)
Date: Fri, 13 Aug 2021 11:01:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 v0.7.3 is available
Message-ID: <20210813150135.2lsc26eolfvfhpqi@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwpirpgk3x2gfi5j"
Content-Disposition: inline


--rwpirpgk3x2gfi5j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello, all:

B4 stable release 0.7.3 is now available. This is a bugfix release that
addresses a few corner-cases and fixes a security issue:

- when using "b4 mbox" with messages containing malicious message-ids, b4
  0.7.2 and earlier could potentially overwrite arbitrary file contents if =
the
  message-id contains path escape characters such as "." and "/". It would =
be
  difficult to exploit this with a meaningful result, as "b4 mbox" always
  saves raw rfc2822 messages, containing full email headers. This problem d=
oes
  not manifest when using "b4 am" or other subcommands as sanitization was
  already applied to generated filenames.

Additional fixes in this release:

- Fixes "b4 am --guess-base" (though a much better implementation is in mas=
ter)
- Ignores any trailer-like content below standard signature marker "-- "
- Fixes a crash when a header is incorrectly qp-encoded
- Fixes a crash when user locale is not utf-8 and a message is passed on st=
din

Everyone must upgrade.

To upgrade, run:

    pip install --upgrade b4

Or simply update to the latest git if using straight from a checkout.

---

Special thanks in this release:

- Kyle Meyer
- Rob Herring
- Uwe Kleine-K=C3=B6nig

Shortlog:

Konstantin Ryabitsev (6):
      Up version to 0.7.3-dev
      Don't append .git unnecessarily
      Sanitize msgid before using it as savename
      Don't consider signature contents for trailers
      Handle decoding incorrectly encoded headers
      Prepare for 0.7.3 release

Kyle Meyer (1):
      Avoid decoding errors when extracting message ID from stdin

Rob Herring (1):
      Allow '.git' to be a file for worktrees

-K

--rwpirpgk3x2gfi5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYRaJTwAKCRC2xBzjVmSZ
bE+wAP4grI3MVB9aIICOxxFV9LKkbnrLgmlsdIpJrrxfUnV7cQD+JqeuxD6VSFRJ
pxpjIuv51i3jyix2VQA7taBo6kziowc=
=iEaH
-----END PGP SIGNATURE-----

--rwpirpgk3x2gfi5j--
